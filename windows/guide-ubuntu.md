# Ubuntu 18.04

last updated somewhere in 2018

Configuration files for my Ubuntu install

(I don't use i3wm currently, so check out my i3 steps [here](./i3wm.md)

(Tested on Xubuntu and Ubuntu, not sure about others)

- `.fonts/` are fonts that I use for both UI and editors

- `.vim/colors/monokai.vim` is my modified color scheme for vim

- `scripts/` contain scripts to be placed in `~/apps/`

- `.gitignore` - default .gitignore for new projects

- `.vimrc` & `.zshrc` are to be placed in the home folder

- `apps.zip` to be extracted into `~/apps/`

- `config` is my i3 configuration file, to be placed in

- `redshift.conf` to be placed in `~/.config/`

---

## Things needed for i3 install

### Available in default Ubuntu PPA

```text
feh
vim
zsh
curl
git
lxappearance
arc-theme
ubuntu-restricted-extras
htop
redshift
maim
scrot
neofetch
gnome-tweak-tool
```

---

### Available on GitHub

- [Font-Awesome](https://github.com/FortAwesome/Font-Awesome/releases)

- [Fira Code](https://github.com/tonsky/FiraCode)

- [Arc-theme](https://github.com/horst3180/Arc-theme)

- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

---

### Available as .deb files

- [Dropbox](https://www.dropbox.com/install-linux)

- VSCode (use [scripts/upedit.sh](./scripts/upedit.sh) to download latest version)

---

### Snapcraft

I am trying to move everything to snapcraft - self-contained, dependency-hell-free applications. (Yay!)

Use `sudo snap install [package-name]` for these following apps:

- [Atom](https://snapcraft.io/atom)
- [Chromium](https://snapcraft.io/chromium)
- [Firefox](https://snapcraft.io/firefox)
- [Intellij IDEA](https://snapcraft.io/intellij-idea-ultimate)
- [Mailspring](https://snapcraft.io/mailspring)
- [Pencilsheep](https://snapcraft.io/pencilsheep)
- [Polarr](https://snapcraft.io/polarr)
- [Skype](https://snapcraft.io/skype)
- [Slack](https://snapcraft.io/slack)
- [Spotify](https://snapcraft.io/spotify)
- [VLC](https://snapcraft.io/vlc)

## Install Checklist

### 1. Create necessary folders

```bash
mkdir ~/apps ~/git ~/Pictures/Wallpapers ~/.fonts
```

### 2. Install stuff

You can install your desired snaps at the same time to save time

```bash
sudo apt-get update
sudo apt-get install vim zsh curl git compton lxappearance arc-theme ubuntu-restricted-extras htop redshift maim neofetch gnome-tweak-tool
```

### 3. Set up git, clone repo, and set as working dir

```bash
cd .ssh && ssh-keygen
git config --global user.name 'username'
git config --global user.email 'email'
git config --global credential.helper 'cache --timeout=3600'
```

Copy contents of id_rsa.pub and add to GitHub settings, then

```bash
git clone git://github.com/potateros/dotfiles.git ~/git/dotfiles/
cd ~/git/dotfiles
```

### 4. Install oh-my-zsh and copy `.zshrc` and `.vimrc` to `home`.

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.bak
mv ~/.vimrc ~/.vimrc.bak
cp .zshrc .vimrc ~/
```

### 5. Unzip and place `apps.zip` in `~/apps/`

```bash
mkdir ~/apps/
unzip apps.tar.gz -d ~/apps/
```

### 6. Copy fonts

```bash
cp .fonts/* ~/.fonts/
```

### 7. Install Dropbox, VSCode, NodeJS, Anaconda, playerctl, virtualenv, ruby rvm, Oralce Java10

```bash
# VSCode
sudo chmod +x ~/apps/upedit.sh
sudo ~/apps/upedit.sh

# Dropbox
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O /tmp/dropbox.deb
sudo dpkg -i /tmp/dropbox.deb

# playerctl
wget https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb -O /tmp/playerctl.deb
sudo dpkg -i /tmp/playerctl.deb

# nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# rvm & ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io -o rvm.sh
cat rvm.sh | bash -s stable
rvm install ruby --default

# virtualenv
sudo apt-get install python3-pip
pip3 install virtualenv

# anaconda
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O /tmp/anaconda.sh
sudo chmod +x /tmp/anaconda.sh
sudo /tmp/anaconda.sh
```
# Oracle Java 10
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java10-installer
sudo apt install oracle-java10-set-default

### 8. Install snaps

```bash
sudo snap install atom --classic
sudo snap install firefox --classic (if you want to...)
sudo snap install intellij-idea-ultimate --classic
sudo snap install slack --classic
sudo snap install chromium mailspring pencilsheep polarr skype spotify vlc
```

### 9. Get wallpapers back

- Download wallpapers and then

```bash
unzip file.zip -d ~/Pictures/wallpapers/
```

### 10. Restore VSCode settings

- `code --install-extension Shan.code-settings-sync`

- Open VSCode and set up Settings Sync

---

## To-Do

- Create a script that can automate most (if not all) of the processes above

- Test on other ubuntu-based distros

- Find a better screenshot tool

---

## Disclaimer

__Remember to change the git configurations to reflect your username and email!__

I've used this on my laptop, but I cannot guarantee it will work on yours. Please don't hate me if it doesn't. Please do let me know if it does though. Thanks ♥
