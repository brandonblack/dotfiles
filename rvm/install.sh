#!/bin/bash

# RVM Install
curl -L https://get.rvm.io | bash -s stable --ignore-dotfiles

# Copy Gemsets
cp -R rvm/gemsets/* ~/.rvm/gemsets

# Install default ruby versions
rvm autolibs enable
rvm install jruby
rvm install rbx
rvm install 2.0.0
rvm install 2.1.0
rvm --default 2.0.0
