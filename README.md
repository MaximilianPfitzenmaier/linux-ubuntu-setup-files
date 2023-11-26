# Linux Setup Files

Setup your new Linux system with a easy to use setup files for github and programming stuff. 

## Philosophy

Easy setup new Linux systems

---

## Contents

- [Linux Setup Files](#linux-setup-files)
  - [Philosophy](#philosophy)
  - [Contents](#contents)
  - [Requirements](#requirements)
    - [Host setup](#host-setup)
  - [Usage](#usage)
    - [Bringing up the stack](#bringing-up-the-stack)
    - [Using setup\_github.sh](#using-setup_githubsh)
    - [Using install\_software.sh](#using-install_softwaresh)
    - [Using .zshrc](#using-zshrc)
  - [Configuration](#configuration)
    - [How to configure setup\_github.sh](#how-to-configure-setup_githubsh)
    - [How to configure install\_software.sh](#how-to-configure-install_softwaresh)
    - [How to configure .zshrc](#how-to-configure-zshrc)
  - [License](#license)

## Requirements

### Host setup

Linux Debian Distribution 

## Usage

### Bringing up the stack

1. Make the github file executable `chmod 777 install_software.sh`
2. Run the github file `./install_software.sh`
3. Make the installation file executable `chmod 777 install_software.sh`
4. Run the installation file `./install_software.sh`

### Using setup_github.sh
This file will setup your local github. By adding your credientals to the global git file
1. Enter your E-Mail
2. Enter your Name
3. Copy your Public Key from the Terminal and paste it into your Github Acount. 

### Using install_software.sh
This file will download some basic stuff influding:
* wget
* ca-certificates
* curl
* gnupg
* libatomic1
* libgconf-2-4
* libc++1
* gconf2-common
* libc++abi1
* libreoffice
* libreoffice-l10n-de
* libreoffice-help-de
* nodejs & npm
* composer
* Visual Studio Code
* Docker & Docker-Compose
* Python
* Postgre
* pgadmin
* vlc player
* spotify
* discord
* mkcert
* oh-my-zsh

### Using .zshrc
You can use this file as a Temaplte for the ZSH-Shell. Just replace it with the installed version of the file.

## Configuration

### How to configure setup_github.sh
You can add or remove lines for your need.

### How to configure install_software.sh
You can add or remove lines for your need.

### How to configure .zshrc
You can use this file as a basic Template

## License
Published under [MIT License](./LICENSE).

[Refernce_Name]: https:/link-to-refernce/