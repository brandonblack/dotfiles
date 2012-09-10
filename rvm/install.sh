#!/bin/bash

# RVM Install
curl -L https://get.rvm.io | bash -s stable

cp rvm/*.gems ~/.rvm/gemsets

rvm install 1.9.3
rvm --default ruby-1.9.3
rvm install jruby
rvm install macruby