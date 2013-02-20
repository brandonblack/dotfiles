#!/bin/bash

# RVM Install
curl -L https://get.rvm.io | bash -s stable

cp rvm/*.gems ~/.rvm/gemsets

rvm install 1.9.3
rvm --default 1.9.3