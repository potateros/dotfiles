#!/bin/bash
# updates vscode and atom
# asks for sudo beforehand for dpkg

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Run as root for dpkg"
    exit
fi

wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
wget https://atom.io/download/deb -O /tmp/atomio.deb

sudo dpkg -i /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/atomio.deb
