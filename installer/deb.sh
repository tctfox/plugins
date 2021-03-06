#!/bin/sh -xu

# 1. Import signing keys
curl -fsSL "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub" | sudo apt-key add "-"

# 2. Add deb repository to sources.list
echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" | sudo tee /etc/apt/sources.list.d/filebot.list

# 3. Update package index
sudo apt-get update

# 4. Install FileBot and its dependencies
sudo apt-get install filebot --install-suggests
