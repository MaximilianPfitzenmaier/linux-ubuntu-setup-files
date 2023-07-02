#!/bin/bash

# Prompt the user  get email
echo "Please enter your email to setup ssh-key:"
read email
ssh-keygen -t ed25519 -C ${email}


# Prompt the user for Git user name
echo "Please enter your Git user name:"
read git_username
 
# Set Git user name
git config --global user.name "$git_username"


# Prompt the user for Git email
echo "Please enter your Git email:"
read git_email

# Set Git email
git config --global user.email "$git_email"

git config --global color.ui auto
git config --global core.editor "code"

echo "your public-key" 
cat ~/.ssh/id_ed25519.pub
