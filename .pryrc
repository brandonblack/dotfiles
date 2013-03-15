require 'rubygems'

Pry.config.editor = 'subl'
Pry.config.history.file = "~/.irb_history"
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

begin
  require 'pry-clipboard'
  Pry.config.commands.alias_command 'ch', 'copy-history'
  Pry.config.commands.alias_command 'cr', 'copy-result'
rescue LoadError => e
  $stderr.puts 'pry-clipboard failed to load.'
end

begin
  require 'pry-nav'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
rescue LoadError => e
  $stderr.puts 'pry-nav failed to load.'
end
