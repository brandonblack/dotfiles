#!/bin/bash

# Install Homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

brew install findutils
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
brew install ack

brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install git

brew install nodejs
brew install mysql
brew install redis
brew install mongodb

brew cleanup