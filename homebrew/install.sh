#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GNU Unix Tools
brew tap homebrew/dupes
brew install findutils coreutils
brew install grep gnu-tar gnu-sed gawk

# Install default brew packages
brew install ack bettercap ctop direnv dnsmasq docker-squash git htop hub jq krew kubectx nginx nvm parallel pigz pinentry-mac python python3 rbenv terminal-notifier tmux tree yq
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
brew cask install graphiql
brew install muesli/tap/duf

# docker-related tooling
brew tap wagoodman/dive
brew install dive

# git-related tooling
brew tap isacikgoz/gitin
brew install gitin

# kubernetes-related tooling
brew cask install minikube
brew tap derailed/k9s
brew install k9s

brew cleanup
