#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GNU Unix Tools
brew tap homebrew/dupes
brew install findutils coreutils
brew install grep gnu-tar gnu-sed gawk

# Install default brew packages
brew install ack bettercap ctop direnv dnsmasq docker-squash git htop hub nginx nvm parallel pigz pinentry-mac python python3 rbenv terminal-notifier tmux tree
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
brew cask install graphiql
brew cask install minikube
brew cleanup
