# Debian

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install zsh fish git wget bat duf tree tldr glances btop speedtest-cli neovim tmux ffmpeg -y
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
brew install nushell fish starship fastfetch neovim yazi unzip lsd curl mailsy
```

```sh
#!/bin/bash

# Create directories
mkdir -p ~/downloads ~/docker/filebrowser ~/.zsh

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
