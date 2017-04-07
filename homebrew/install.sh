#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install GNU Unix Tools
brew install findutils coreutils

# Install default brew packages
brew install rbenv git tmux node pigz hub htop parallel tree ack terminal-notifier python python3 pinentry-mac heroku
brew cleanup

# Python Setup
pip install virtualenv virtualenvwrapper

# Install default node packages
npm install --global speed-test
