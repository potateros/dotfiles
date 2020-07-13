#!/bin/bash
# potateros' auto install script for Ubuntu
# version 1.0 2018-10-13

# asks for sudo beforehand for dpkg
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Run as root for dpkg"
    exit
fi

# increase swap space to 8GB
sudo swapoff /swapfile
sudo fallocate -l 8G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# creates all necessary folders
mkdir /home/potateros/Downloads/temp
sudo chown -R potateros:potateros /home/potateros/Downloads/temp


# apt-get
sudo apt update
sudo apt upgrade
sudo apt -y install git vim ranger htop curl zsh lxappearance arc-theme dconf-tools plank gnome-tweaks chrome-gnome-shell kdeconnect autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev

# theme
sudo add-apt-repository ppa:snwh/ppa
sudo apt-get update
sudo apt-get -y install paper-icon-theme

# remove ubuntu dock
sudo apt -y remove gnome-shell-extension-ubuntu-dock

# gsettings
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4500
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 7
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 5.983333333333333

gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Paper'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-date true

gsettings set org.gnome.nautilus.desktop trash-icon-visible false

gsettings set org.gnome.shell enabled-extensions ['ubuntu-appindicators@ubuntu.com']
gsettings set org.gnome.shell enable-hot-corners true

gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot '<Super>Print'
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot '<Super><Shift>Print'
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '<Super><Control>Print'
gsettings set org.gnome.settings-daemon.plugins.media-keys screencast '<Super><Control>R'
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 60


gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up ['<Super>Up', '<Control><Alt>Down']
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down ['<Super>Down', '<Control><Alt>Down']

# Dropbox wget & dpkg
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O /home/potateros/Downloads/temp/dropbox.deb
sudo dpkg -i /home/potateros/Downloads/temp/dropbox.deb

# Chrome wget & dpkg
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /home/potateros/Downloads/temp/chrome.deb
sudo dpkg -i /home/potateros/Downloads/temp/chrome.deb

# Franz wget & dkpg
wget https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.18/franz_5.0.0-beta.18_amd64.deb -O /home/potateros/Downloads/temp/franz.deb
sudo dpkg -i /home/potateros/Downloads/temp/franz.deb

# shutter (awesome screenshot tool)
sudo add-apt-repository ppa:shutter/ppa
sudo apt-get update
sudo apt-get install shutter

# VSCode
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb

# snaps
#sudo snap install vscode --classic (vscode snap not officially maintained yet)
sudo snap install intellij-idea-ultimate --classic
sudo snap install slack --classic
sudo snap install android-studio --classic
sudo snap install sublime-text --classic
sudo snap install arduino-mhall119
sudo snap install telegram-desktop
sudo snap install spotify
sudo snap install vlc

# github dotfiles
git clone https://github.com/potateros/dotfiles /home/potateros/Downloads/dotfiles-master/
cp -r /home/potateros/Downloads/temp/dotfiles-master/bin /home/potateros/
cp /home/potateros/Downloads/temp/dotfiles-master/.vimrc /home/potateros/
cp -r /home/potateros/Downloads/temp/dotfiles-master/.vim /home/potateros/
cp /home/potateros/Downloads/temp/dotfiles-master/.zshrc /home/potateros/
cp -r /home/potateros/Downloads/temp/dotfiles-master/.fonts /home/potateros/

# git
#ssh-keygen
#git config --global user.name ''
#git config --global user.email ''
git config --global credential.helper 'cache --timeout=3600'

# nvm & nodejs
#wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
#nvm install node
#nvm use node

# nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential
npm config set prefix ~/.local

# rbenv and ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.5.1
rbenv global 2.5.1
echo "gem: --no-document" > ~/.gemrc # turns off local docs
gem install bundler # classic
gem install rails
rbenv rehash

# virtualenv pip python and anaconda
wget https://repo.continuum.io/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O /home/potateros/Downloads/temp/miniconda.sh
sudo chmod +x /home/potateros/Downloads/temp/miniconda.sh
sudo /home/potateros/Downloads/temp/miniconda.sh
source /home/potateros/.zshrc
pip install virtualenv

# oracle java 10
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt -y install oracle-java10-installer
sudo apt -y install oracle-java10-set-default

# vscode
code --install-extension Shan.code-settings-sync

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo chown -R potateros:potateros /home/potateros/.oh-my-zsh

chsh -s $(which zsh)


firefox https://extensions.gnome.org/
firefox https://extensions.gnome.org/extension/21/workspace-indicator/
firefox https://extensions.gnome.org/extension/55/media-player-indicator/
firefox https://extensions.gnome.org/extension/36/lock-keys/
firefox https://extensions.gnome.org/extension/1236/noannoyance/
firefox https://extensions.gnome.org/extension/7/removable-drive-menu/
firefox https://extensions.gnome.org/extension/750/openweather/
firefox https://extensions.gnome.org/extension/8/places-status-indicator/
firefox https://extensions.gnome.org/extension/1080/transparent-notification/
firefox https://extensions.gnome.org/extension/1073/transparent-osd/
