#!/bin/bash

# RVM Install
curl -L https://get.rvm.io | bash -s stable

cp -R rvm/gemsets/* ~/.rvm/gemsets

rvm install 1.8.7 --autolibs=4
rvm install 1.9.3 --autolibs=4
rvm install jruby --autolibs=4
rvm install 2.0.0 --autolibs=4
rvm --default 2.0.0