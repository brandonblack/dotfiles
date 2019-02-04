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

# Install Krew
(
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://storage.googleapis.com/krew/v0.2.1/krew.{tar.gz,yaml}" &&
  tar zxvf krew.tar.gz &&
  ./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" install \
    --manifest=krew.yaml --archive=krew.tar.gz
)

# Copy All-the-Things
./copy.sh
