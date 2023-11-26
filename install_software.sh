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
install_and_update_arrays "libatomic1" 
install_and_update_arrays "libgconf-2-4" 
install_and_update_arrays "libc++1" 
install_and_update_arrays "gconf2-common" 
install_and_update_arrays "libc++abi1" 
install_and_update_arrays "libreoffice" 
install_and_update_arrays "libreoffice-l10n-de"
install_and_update_arrays "libreoffice-help-de" 


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
sudo mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
sudo chmod +x ~/.docker/cli-plugins/docker-compose
install_and_update_arrays "docker-compose"
sudo usermod -aG docker $USER

# Install Python
echo "installing python3 ..."
install_and_update_arrays "python3"

# Install pip
install_and_update_arrays "python3-pip"

#install postgre
echo "installing postgree ..."
install_and_update_arrays "postgresql" 
install_and_update_arrays "postgresql-contrib"
sudo systemctl start postgresql.service

# Install pgAdmin4
echo "install pgAdmin4 ... "
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

install_and_update_arrays "pgadmin4"

# install Powerline Fonts
echo "installing powerfonts for oh-my-zsh"
install_and_update_arrays "fonts-powerline" 

# Install Powerline fonts
echo "installing powerfonts for oh-my-zsh"
git clone https://github.com/abertsch/Menlo-for-Powerline.git
sudo mv Menlo-for-Powerline/Menlo*.ttf /usr/share/fonts

# Install VLC Player
echo "installing vlc player ..."
install_and_update_arrays "vlc"


# install spotify
echo "installing spotify ... "
snap install spotify

# install discord
echo "installing discord ..."
snap install discord


#install mkcert
echo "install mkcert"
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
sudo mv mkcert-v1.4.3-linux-amd64 /usr/bin/mkcert
chmod +x /usr/bin/mkcert
sudo apt install libnss3-tools
mkcert -install

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

# Install Oh-My-Zsh
echo "installing oh-my-zsh ..."
sudo apt install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
install_and_update_arrays "Oh-My-Zsh"



