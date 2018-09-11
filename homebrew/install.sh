#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GNU Unix Tools
brew install findutils coreutils

# Install default brew packages
brew install ack ctop direnv dnsmasq docker-squash git htop hub nginx nvm parallel pinentry-mac python python3 rbenv terminal-notifier tmux tree
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
brew cask install graphiql
brew cask install minikube
brew cleanup
