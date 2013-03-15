require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

# Required Gems
%w{ap wirble}.each do |pkg|
  begin
    require pkg
  rescue LoadError => err
    $stderr.puts "Error Loading: #{err}"
  end
end

# Wirble
IRB.conf[:AUTO_INDENT] = true
if defined?(Wirble)
  Wirble.init
  Wirble.colorize
end

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