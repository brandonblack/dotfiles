npm install -g m

cp -R m/data /data
sudo chown -R /data

gem install lunchy
lunchy install /data/config/org.mongodb.default.plist

m pre change /data/scripts/shutdown
m post change /data/scripts/start

m pre install /data/scripts/shutdown
m post install /data/scripts/start

m stable
m latest
