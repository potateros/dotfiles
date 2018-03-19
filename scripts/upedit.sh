#!/bin/bash
# updates vscode and atom
# asks for sudo beforehand for dpkg
# EDIT: atom editor is now a snap, so install with snap install atom --classic and update with snap refresh


if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Run as root for dpkg"
    exit
fi

wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
# wget https://atom.io/download/deb -O /tmp/atomio.deb
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O /tmp/dropbox.deb

sudo dpkg -i /tmp/code_latest_amd64.deb
# sudo dpkg -i /tmp/atomio.deb
sudo dpkg -i /tmp/dropbox.deb
