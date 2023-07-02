#!/bin/bash

# Update the system
sudo apt update
sudo apt upgrade -y

# Arrays to store successful and failed installations
successful=()
failed=()

# Function to install software and update successful or failed array
install_and_update_arrays() {
    software_name=$1
    if sudo apt install -y $software_name; then
        successful+=($software_name)
    else
        failed+=($software_name)
    fi
}

# Install wget
echo "installing base software ..."
install_and_update_arrays "wget"
install_and_update_arrays "ca-certificates" 
install_and_update_arrays "curl" 
install_and_update_arrays "gnupg"

# Install Git
echo "installing git ..."
install_and_update_arrays "git"

# Install Node.js and npm
echo "installing node ..."
install_and_update_arrays "nodejs"
install_and_update_arrays "npm"

# Install Composer
echo "installing composer ..."
install_and_update_arrays "composer"

# Install Visual Studio Code
echo "installing visual studio code ..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
install_and_update_arrays "code"

# Install Docker
echo "installing Docker ..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

install_and_update_arrays "docker-ce" 
install_and_update_arrays "docker-ce-cli" 
install_and_update_arrays "containerd.io" 
install_and_update_arrays "docker-buildx-plugin" 
install_and_update_arrays "docker-compose-plugin"  

# Install Docker Compose
echo "installing docker-compose ..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
install_and_update_arrays "docker-compose"

# Install Python
echo "installing python3 ..."
install_and_update_arrays "python3"

# Install Powerline fonts
echo "installing powerfonts for oh-my-zsh"
install_and_update_arrays "fonts-powerline"

# Install Oh-My-Zsh
echo "installing oh-my-zsh ..."
sudo apt install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
install_and_update_arrays "Oh-My-Zsh"

echo "Software installation complete!"

# Print the successful array
echo "Successful installations:"
for software in "${successful[@]}"
do
    echo $software
done

# Print the failed array
echo "Failed installations:"
for software in "${failed[@]}"
do
    echo $software
done

