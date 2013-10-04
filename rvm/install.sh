#!/bin/bash

# RVM Install
curl -L https://get.rvm.io | bash -s stable

# Copy Gemsets
cp -R rvm/gemsets/* ~/.rvm/gemsets

# Make Executable and Copy Hooks
find rvm/hooks/* -type f -exec chmod +x {} \;
cp -R rvm/hooks/* ~/.rvm/hooks

# Install default ruby versions
rvm install 1.8.7
rvm install 1.9.3
rvm install jruby
rvm install 2.0.0
rvm --default 2.0.0
