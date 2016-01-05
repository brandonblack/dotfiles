#!/bin/bash

# Need admin rights
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the OS X install
./osx/install.sh

# Run the Homebrew install
./homebrew/install.sh

# Switch to z-shell and install oh-my-zsh
./shell/install.sh

# Install m and MongoDB
./m/install.sh

# Copy to home folder
./copy.sh
