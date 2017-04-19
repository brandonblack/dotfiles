#!/bin/bash

rbenv install 2.3.3
rbenv install 2.1.6

rbenv shell 2.3.3
gem install bundler lunchy pry pry-nav
rbenv shell -

rbenv shell 2.1.6
gem install bundler lunchy pry pry-nav
rbenv shell -

rbenv rehash
