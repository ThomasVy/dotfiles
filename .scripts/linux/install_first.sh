#!/bin/bash

sudo apt update
sudo apt install gpg stow zsh curl wget -y 
cd ..
stow .

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
