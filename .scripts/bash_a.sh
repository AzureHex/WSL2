# Prompt for sudo password
echo "This script requires sudo privileges. Please enter your password."
sudo -v

# Check if the password was entered correctly
if [ $? -ne 0 ]; then
    echo "Sudo authentication failed. Exiting."
    exit 1
fi

echo -e "\n# Aliases\nalias ll='ls -l'\nalias la='ls -A'\nalias l='ls -CF'\nalias bat='batcat'\n\neval \"\$($(brew --prefix)/bin/brew shellenv)\"\nexport HOMEBREW_NO_ANALYTICS=1\n\n# Correcting if it's 'fastfetch'\nfastfetch\n" >> ~/.bashrc

sudo apt update && sudo apt upgrade -y
sudo apt install fish git curl tldr -y

sudo bash -c 'cat <<EOL > /etc/wsl.conf
[boot]
systemd=true
EOL'

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo usermod -aG docker $USER

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
