#!/bin/bash

# Need admin rights
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the OS X install
./osx/install.sh

# Run the Homebrew install
./homebrew/install.sh

# Run the RVM install
./rvm/install.sh

# Install Pow (http://pow.cx)
curl get.pow.cx | sh

# Pow Notes: Go open node_modules/nack/lib/nack/server.rb inside
# ~/Library/Application Support/Pow/Current and replace
# sock.close_read with:
#
# begin
#   sock.close_read
# rescue IOError
#   raise unless RUBY_ENGINE == 'jruby'
# end

# Switch to z-shell and install oh-my-zsh
./shell/install.sh

# Copy to home folder
for file in .{zshrc,aliases,exports,functions,gitconfig,gemrc,pryrc,railsrc,ruby-version,irbrc,jrubyrc,rvmrc}; do
  cp "$file" ~/
done
unset file