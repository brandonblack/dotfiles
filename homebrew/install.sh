#!/bin/bash

# Install Homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

brew install findutils
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install non-LLVM gcc
brew install apple-gcc42
sudo ln -s `brew --prefix apple-gcc42`/bin/gcc-4.2 /usr/bin/gcc-4.2
sudo ln -s `brew --prefix apple-gcc42`/bin/g++-4.2 /usr/bin/gcc-4.2

# Install default brew packages
brew install git node hub reattach-to-user-namespace tree ack
brew cleanup