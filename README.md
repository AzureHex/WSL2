# Debian

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install fish git curl tldr -y
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
sudo bash -c 'cat <<EOL > /etc/wsl.conf
[boot]
systemd=true
EOL'
```

```sh
#!/bin/bash

# Homebrew Formulae
brew install zsh fish nushell starship fastfetch neovim yazi unzip lsd bat duf tree glances speedtest-cli btop tmux ffmpeg mailsy

# Create directories
mkdir -p ~/downloads ~/docker/filebrowser ~/.zsh ~/.local/share/tldr

# Updating tldr pages
tldr -u

# Installing tgpt
curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin

# yazi plugin
git clone https://gitee.com/DreamMaoMao/searchjump.yazi.git ~/.config/yazi/plugins/searchjump.yazi

# Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh
git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh

# Navigate to home directory
cd

# Navigate to the filebrowser directory
cd ~/docker/filebrowser

# Create the database file
touch filebrowser.db

# Create the docker-compose.yml file
cat <<EOL > compose.yml
services:
  file-browser:
    image: filebrowser/filebrowser:latest
    container_name: filebrowser
    user: 1000:1000
    privileged: true
    environment:
      - TZ=Asia/Kolkata
    ports:
      - 8081:80
    volumes:
      - /:/srv
      - /home/eyes/docker/filebrowser/filebrowser.db:/database.db
    restart: unless-stopped
    networks:
      - net

networks:
  net:
    external: true
    name: net
EOL

echo "Setup complete! You can now run 'docker-compose up -d' from ~/docker/filebrowser."
```
