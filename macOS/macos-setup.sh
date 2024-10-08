#!/bin/bash

mkdir ~/Developer

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install xcode
xcode-select --install

# Copy .zshrc, .gitconfig, .vimrc
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

# Install Antigen & friends
cd ~
curl -L git.io/antigen > ~/.oh-my-zsh/antigen.zsh
source ~/.oh-my-zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme robbyrussell
antigen apply

# Install brew packages
brew install bat
brew install coreutils
brew install cowsay
brew install derailed/k9s/k9s
brew install docker
brew install exa
brew install fasd
# brew install firebase-cli
brew install fortune
brew install gh
# brew install gnupg
# brew install golang
brew install jenv
brew install kubernetes-cli
brew install lolcat
brew install nvm
# brew install openjdk@11
brew install ranger
# brew install rvm
brew install tldr
brew install uv
brew install wget
brew install --cask aldente
brew install --cask android-studio
brew install --cask anydesk
brew install --cask arc
brew install --cask betterdisplay
# brew install --cask boop
brew install --cask caffeine
brew install --cask calibre
# brew install --cask dbeaver-community
# brew install --cask docker
brew install --cask evernote
# brew install --cask figma
brew install --cask firefox
# brew install --cask gitkraken
brew install --cask google-chrome
brew install --cask handbrake
# brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask itsycal
brew install --cask jetbrains-toolbox
brew install --cask karabiner-elements
brew install --cask keka
# brew install --cask libreoffice
brew install --cask linearmouse
brew install --cask logi-options+
brew install --cask logitech-g-hub
brew install --cask macfuse
brew install --cask macs-fan-control
brew install --cask mongodb-compass
# brew install --cask ngrok
brew install --cask onedrive
brew install --cask orbstack
# brew install --cask openvpn-connect
brew install --cask paragon-ntfs
# brew install --cask pock
brew install --cask postman
brew install --cask raycast
brew install --cask rescuetime
# brew install --cask rubymine
brew install --cask slack
# brew install --cask spacedrive
brew install --cask spotify
# brew install --cask teamspeak-client
# brew install --cask teamviewer
brew install --cask tiles
# brew install --cask transmission
# brew install --cask turbo-boost-switcher
brew install --cask visual-studio-code
brew install --cask vlc
# brew install --cask zoomus

wget https://freefilesync.org/download/FreeFileSync_13.3_macOS.zip
