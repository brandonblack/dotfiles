#!/bin/bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install GNU Unix Tools
brew install findutils coreutils

# Install default brew packages
brew install findutils rbenv git tmux node hub parallel reattach-to-user-namespace tree ack terminal-notifier
brew cleanup
