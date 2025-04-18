#!/bin/bash

sudo apt update
sudo apt install stow
stow .

sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exec zsh

sudo apt install fontconfig
fc-cache -fv

for file in install/*.sh; do
  if [ -x "$file" ]; then  # Check if the file is executable
    ./"$file"  # Execute the file
  fi
done
