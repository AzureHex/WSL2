# Debian

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install fish git curl tldr -y
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
brew install zsh fish nushell starship fastfetch neovim yazi unzip lsd bat duf tree glances speedtest-cli btop tmux ffmpeg mailsy
```

```sh
#!/bin/bash

# Create directories
mkdir -p ~/downloads ~/docker/filebrowser ~/.zsh

# Clone searchjump
git clone https://gitee.com/DreamMaoMao/searchjump.yazi.git ~/.config/yazi/plugins/searchjump.yazi

# Navigate to .zsh directory
cd ~/.zsh

# Clone zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-autocomplete.git

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
