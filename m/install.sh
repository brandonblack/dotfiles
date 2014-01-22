#!/bin/bash

npm install -g m

sudo mkdir -p /data
sudo chown -R `whoami` /data

cp -R m/data/* /data
chmod +x /data/scripts/*

sed -i '' "s/user-placeholder/`whoami`/g" /data/config/org.mongodb.default.plist

gem install lunchy
lunchy install /data/config/org.mongodb.default.plist

m pre change /data/scripts/shutdown
m post change /data/scripts/start

m pre install /data/scripts/shutdown
m post install /data/scripts/start

m stable
m latest
