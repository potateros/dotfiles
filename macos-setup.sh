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
brew cask install docker
brew cask install evernote
brew cask install figma
brew cask install firefox
brew cask install gitkraken
brew cask install google-chrome
# brew cask install intellij-idea
brew cask install iterm2
brew cask install libreoffice
brew cask install macs-fan-control
# brew cask install ngrok
# brew cask install notion
# brew cask install openvpn-connect
# brew cask install pock
brew cask install postman
brew cask install rescuetime
# brew cask install rubymine
brew cask install slack
brew cask install spotify
brew cask install teamspeak-client
brew cask install tiles
brew cask install turbo-boost-switcher
brew cask install vlc
# brew cask install zoomus
