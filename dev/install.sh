#!/bin/bash

# Setup DNSMasq
echo "address=/dev/127.0.0.1" > /usr/local/etc/dnsmasq.conf

sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF

# Setup Nginx
tee /usr/local/etc/nginx/nginx.conf > /dev/null << EOF
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    include servers/*;
}
EOF

# Link Daemons and Restart All-the-Things
sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

sudo cp -fv /usr/local/opt/nginx/*.plist  /Library/LaunchDaemons
sudo chmod 600 /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
sudo chown root /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
