#!/bin/bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew install findutils
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install non-LLVM gcc
brew install apple-gcc42
sudo ln -s `brew --prefix apple-gcc42`/bin/gcc-4.2 /usr/bin/gcc-4.2
sudo ln -s `brew --prefix apple-gcc42`/bin/g++-4.2 /usr/bin/gcc-4.2

# Install default brew packages
brew install git tmux node hub reattach-to-user-namespace tree ack terminal-notifier
brew cleanup
