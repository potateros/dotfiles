# macOS

Commands for macOS-specific install

### First things' first
- Install oh-my-zsh
  - `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Install Homebrew
  - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Xcode & friends
  - `xcode-select --install`

### Brew

- General Utilities
  - `brew install bat coreutils gnupg htop ranger wget yarn`
- Dev Stuff
  - `brew install deno imagemagick derailed/k9s/k9s kubernetes-cli nvm postgresql redis yarn`
- GUI Dev Apps
  - `brew cask figma gitkraken jetbrains-toolbox jira-client iterm2 openvpn-connect postman rubymine`
- GUI General
  - `brew cask evernote franz slack spotify vlc`
- GUI Tools
  - `brew cask intel-power-gadget macs-fan-control pock rescuetime spectacle turbo-boost-switcher`
