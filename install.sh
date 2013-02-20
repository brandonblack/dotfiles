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

# Switch to z-shell and install oh-my-zsh
./shell/install.sh

# Copy to home folder
for file in .{zshrc,aliases,exports,functions,gitconfig,gemrc,pryrc,railsrc,rvmrc}; do
  cp "$file" ~/
done
unset file