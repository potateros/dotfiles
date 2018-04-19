# dotfiles

Configuration files for my i3wm install

(Tested on Xubuntu and Ubuntu, not sure about others)

- `.fonts/` are fonts that I use for both UI and editors

- `.vim/colors/monokai.vim` is my modified color scheme for vim

- `scripts/` contain scripts to be placed in `~/apps/`

- `.gitignore` - default .gitignore for new projects

- `.vimrc` & `.zshrc` are to be placed in the home folder

- `apps.zip` to be extracted into `~/apps/`

- `config` is my i3 configuration file, to be placed in

- `redshift.conf` to be placed in `~/.config/`
`~/.config/i3/`
---

## Things needed for i3 install


### Available in default Ubuntu PPA
```
i3
i3blocks
rofi
feh
vim
zsh
curl
git
compton
lxappearance
arandr
arc-theme
ubuntu-restricted-extras
pavucontrol
htop
redshift
maim
scrot
neofetch
gnome-tweak-tool (if using ubuntu)
```

---

### Available on GitHub

- [i3-volume](https://github.com/hastinbe/i3-volume)

- [xbright](https://github.com/snobb/xbright)

- [Font-Awesome](https://github.com/FortAwesome/Font-Awesome/releases)

- [Fira Code](https://github.com/tonsky/FiraCode)

- [Arc-theme](https://github.com/horst3180/Arc-theme)

- [playerctl](https://github.com/acrisci/playerctl/releases)

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
```
mkdir ~/apps ~/git ~/Pictures/wallpapers ~/.fonts ~/.config/i3
```

### 2. Install stuff
You can install your desired snaps at the same time to save time
```
sudo apt-get update
sudo apt-get install i3 i3blocks rofi feh vim zsh curl git compton scrot lxappearance arandr arc-theme ubuntu-restricted-extras pavucontrol htop redshift maim neofetch gnome-tweak-tool
```

### 3. Set up git, clone repo, and set as working dir

```
cd .ssh && ssh-keygen
git config --global user.name 'potateros'
git config --global user.email 'ericngu97@gmail.com'
git config --global credential.helper 'cache --timeout=3600'
```
Copy contents of id_rsa.pub and add to GitHub settings, then
```
git clone git://github.com/potateros/dotfiles.git ~/git/dotfiles/
cd ~/git/dotfiles
```

### 4. Install oh-my-zsh and copy `.zshrc` and `.vimrc` to `home`.
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.bak
mv ~/.vimrc ~/.vimrc.bak
cp .zshrc .vimrc ~/
```

### 5. Place `config` in `~/.config/i3/`
```
mv ~/.config/i3/config ~/.config/i3/config.bak
cp config ~/.config/i3/
```
Remember to change the $home at the top of i3config file

### 6. Unzip and place `apps.zip` in `~/apps/`
```
mkdir ~/apps/
unzip apps.tar.gz -d ~/apps/
```

### 7. Copy fonts
```
cp .fonts/* ~/.fonts/
```

### 8. Install Dropbox, VSCode, NodeJS, Anaconda, playerctl, virtualenv, ruby rvm
```
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

### 9. Install snaps
```
sudo snap install atom --classic
sudo snap install firefox --classic (if you want to...)
sudo snap install intellij-idea-ultimate --classic
sudo snap install slack --classic
sudo snap install chromium mailspring pencilsheep polarr skype spotify vlc
```

### 10. Get wallpapers back
- Download wallpapers and then
```
unzip file.zip -d ~/Pictures/wallpapers/
```

### 11. Restore VSCode settings

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
