#!/bin/bash

file_name="go1.23.4.linux-amd64.tar.gz"

sudo wget https://golang.org/dl/$file_name

echo "Installing Go"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $file_name
sudo chown -R root:root /usr/local/go
mkdir -p $HOME/go/{bin,src}

echo "Changing Environment Variables"
echo 'export GOPATH=$HOME/go' >>~/.zshenv
echo 'export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin' >>~/.zshenv

sudo rm $file_name
