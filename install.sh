#!/bin/bash

# Run the OS X install
sudo ./osx/install.sh

# Run the Homebrew install
./homebrew/install.sh

# Core Tools
./ruby/install.sh
./python/install.sh
./node/install.sh

# Switch to z-shell and install oh-my-zsh
./shell/install.sh

# Setup Dev Environment (dnsmasq + nginx)
./dev/install.sh

# Install Fonts
cp fonts/*.otf /Library/Fonts/

# Copy All-the-Things
./copy.sh
