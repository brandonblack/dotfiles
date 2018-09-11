#!/bin/bash

export NVM_DIR="$HOME/.nvm" 
. "$(brew --prefix nvm)/nvm.sh"

mkdir ~/.nvm
nvm install --lts
nvm install node

# Install default node packages
npm install --global speed-test tldr
