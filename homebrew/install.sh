#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GNU Unix Tools
brew install findutils coreutils

# Install default brew packages
brew install direnv rbenv git ctop tmux nvm hub htop parallel tree ack terminal-notifier python python3 pinentry-mac dnsmasq nginx
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
brew cleanup
