#!/bin/bash

# Run the OS X install
sudo ./osx/install.sh

# Run the Homebrew install
./homebrew/install.sh

# Switch to z-shell and install oh-my-zsh
./shell/install.sh

# Install m and MongoDB
./m/install.sh

# Copy to home folder
./copy.sh
