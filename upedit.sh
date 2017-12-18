#!/bin/bash
#updates vscode and atom
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
wget https://atom.io/download/deb -O /tmp/atomio.deb

sudo dpkg -i /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/atomio.deb
