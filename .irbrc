require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

def ls(path='.')
  contents = Dir[ File.join( path, '*' )].map{|res| res =~ /^#{path}\/?/; $' }
  puts contents.empty? ? 'The directory is empty.' : contents
end
alias dir ls

def pwd
  puts "\n#{Dir.pwd}\n"
end

def pbcopy(str)
  `echo "#{str}" | pbcopy`
  true
end
alias :cp :pbcopy

def cat(path)
  contents = File.read path.to_s
  puts contents.empty? ? 'The file is empty.' : contents
end

# Add & Subtract with Hashes
class Hash
  alias :+ :merge
  def -(other)
    if other.is_a? Hash
      reject { |k,v| other[k] == v }
    else
      reject { |k,v| k == other }
    end
  end
end

# Format & Show Object Methods
class Object

  def colputs(array)
    puts "\n\n"
    def num_columns; 4; end
    def col_width; 25; end
    def force_length(x)
      x = x.to_s
      max_length = col_width+2
      if x.length > max_length
        x = x[0..max_length-4] + '...'
      end
      x += (' '*max_length)
      x[0..max_length-1]
    end
    def get_element(array, i) # displays in column order instead of row order
      num_rows = (array.length/num_columns)+1
      col = i % num_columns
      row = i / num_columns
      array[col*num_rows+row]
    end
    for i in (0..array.length)
      print force_length(get_element(array, i))
      print "  "
      puts if (i % num_columns) == (num_columns-1)
    end
    puts "\n\n"
  end

  def show_methods
    colputs (self.methods - Object.new.methods).sort
  end
end

# Short Hand Require
def rq(lib)
  require lib.to_s
end

# Restart IRB
def restart!
  at_exit { exec$0 } # remember history
  exit
end

# helpers for showing an object's size in memory
module Memory
  # sizes are guessed, I was too lazy to look
  # them up and then they are also platform
  # dependent
  REF_SIZE = 4 # ?
  OBJ_OVERHEAD = 4 # ?
  FIXNUM_SIZE = 4 # ?

  # informational output from analysis
  MemoryInfo = Struct.new :roots, :objects, :bytes, :loops

  def self.analyze(*roots)
    an = Analyzer.new
    an.roots = roots
    an.analyze
  end

  class Analyzer
    attr_accessor :roots
    attr_reader   :result

    def analyze
      @result = MemoryInfo.new roots, 0, 0, 0
      @objs = {}

      queue = roots.dup

      until queue.empty?
        obj = queue.shift

        case obj
        # special treatment for some types
        # some are certainly missing from this
        when IO
          visit(obj)
        when String
          visit(obj) { @result.bytes += obj.size }
        when Fixnum
          @result.bytes += FIXNUM_SIZE
        when Array
          visit(obj) do
            @result.bytes += obj.size * REF_SIZE
            queue.concat(obj)
          end
        when Hash
          visit(obj) do
            @result.bytes += obj.size * REF_SIZE * 2
            obj.each {|k,v| queue.push(k).push(v)}
          end
        when Enumerable
          visit(obj) do
            obj.each do |o|
              @result.bytes += REF_SIZE
              queue.push(o)
            end
          end
        else
          visit(obj) do
            obj.instance_variables.each do |var|
              @result.bytes += REF_SIZE
              queue.push(obj.instance_variable_get(var))
            end
          end
        end
      end

      @result
    end

  private
    def visit(obj)
      id = obj.object_id

      if @objs.has_key? id
        @result.loops += 1
        false
      else
        @objs[id] = true
        @result.bytes += OBJ_OVERHEAD
        @result.objects += 1
        yield obj if block_given?
        true
      end
    end
  end
end
