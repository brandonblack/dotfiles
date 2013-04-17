#!/bin/bash

# Install Homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

brew install findutils
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
brew install ack

brew tap homebrew/dupes
brew tap homebrew/dupes
brew install apple-gcc42
sudo ln -s /usr/local/bin/gcc-4.2 /usr/bin/gcc-4.2

brew install homebrew/dupes/grep
brew install git

brew install node
brew install redis
brew install hub

brew cleanup