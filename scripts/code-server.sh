#!/bin/bash -eux

# Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Enable and start code-server
sudo systemctl enable --now code-server@$USER

# Disable auth and bind to port 8080
sed -i.bak 's/auth: password/auth: none/' ~/.config/code-server/config.yaml
sed -i.bak 's/bind-addr: 127\.0\.0\.1\:8080/bind-addr: 0\.0\.0\.0\:8080/' ~/.config/code-server/config.yaml

# Restart code-server
sudo systemctl stop code-server@$USER
sudo systemctl start code-server@$USER