#!/bin/bash

mkdir ~/Developer

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install xcode
xcode-select --install

# Install zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy .zshrc, .gitconfig, .vimrc
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

# Install brew packages
brew install bat
brew install coreutils
brew install cowsay
brew install derailed/k9s/k9s
brew install exa
brew install fasd
# brew install firebase-cli
brew install fortune
brew install gnupg
brew install golang
brew install jenv
brew install kubernetes-cli
brew install lolcat
brew install nvm
brew install openjdk@11
brew install ranger
brew install rvm
brew install tldr
brew install wget
brew install --cask dbeaver-community
brew install --cask  docker
brew install --cask  evernote
brew install --cask figma
brew install --cask firefox
brew install --cask gitkraken
brew install --cask google-chrome
# brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask libreoffice
brew install --cask macs-fan-control
# brew install --cask ngrok
# brew install --cask notion
# brew install --cask openvpn-connect
# brew install --cask pock
brew install --cask postman
brew install --cask rescuetime
# brew install --cask rubymine
brew install --cask slack
brew install --cask spotify
brew install --cask teamspeak-client
brew install --cask tiles
brew install --cask turbo-boost-switcher
brew install --cask vlc
# brew install --cask zoomus
