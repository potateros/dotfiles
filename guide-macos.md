# macOS 10.15

last updated August 2020

Commands for macOS-specific install

### First things' first
- Install oh-my-zsh
  - `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Install Homebrew
  - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Xcode & friends
  - `xcode-select --install`

### Brew

`brew install`

```bash
brew install \
bat \
coreutils \
deno \
derailed/k9s/k9s \
firebase-cli \
gnupg \
golang \
htop \
imagemagick \
jenv \
kubernetes-cli \
nvm \
postgresql \
ranger \
redis \
rvm \
tldr \
wget \
yarn \
```

`brew cask install`

```bash
brew cask install \
docker \
evernote \
figma \
firefox \
franz \
gitkraken \
google-chrome \
intellij-idea \
iterm2 \
libreoffice \
macs-fan-control \
ngrok \
notion \
openvpn-connect \
pock \
postman \
rescuetime \
rubymine \
slack \
spotify \
teamspeak-client \
tiles \
turbo-boost-switcher \
vlc \
zoomus \
```

Then, set up ZSH and env stuff in [guide-sh.md](guide-sh.md)
