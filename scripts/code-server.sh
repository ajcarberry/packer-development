#!/bin/bash -eux

max_retry=20
retry=0

# Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Enable and start code-server
systemctl enable --now code-server@$USER
systemctl start code-server@$USER

# Disable auth and bind to port 8080
while [ ${retry} -lt ${max_retry} ]; do
   if [ -f ~/.config/code-server/config.yaml ]; then
      break
   else
      (( retry = retry + 1 ))
      sleep 1
   fi
done
sed -i.bak 's/auth: password/auth: none/' ~/.config/code-server/config.yaml
sed -i.bak 's/bind-addr: 127\.0\.0\.1\:8080/bind-addr: 0\.0\.0\.0\:8080/' ~/.config/code-server/config.yaml

# Restart code-server
systemctl restart code-server@$USER