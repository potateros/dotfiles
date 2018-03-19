# dotfiles

Configuration files for my i3wm install

(Tested on Xubuntu and Ubuntu, not sure about others)

- `.fonts/` are fonts that I use for both UI and editors

- `.vim/colors/monokai.vim` is my modified color scheme for vim

- `scripts/` contain scripts to be placed in `~/apps/`

- `.gitignore` - default .gitignore for new projects

- `.vimrc` & `.zshrc` are to be placed in the home folder

- `apps.tar.gz` to be extracted into `~/apps/`

- `config` is my i3 configuration file, to be placed in

- `redshift.conf` to be placed in `~/.config/`
`~/.config/i3/`
---

## Things needed for i3 install


### Available in default Ubuntu PPA
```
i3
vim
git
compton
feh
imagemagick
lxappearance
arandr
arc-theme
ubuntu-restricted-extras
pactl
pavucontrol
conky
htop
redshift
maim
zsh
```

---

### Needs to add ppa before installing
- neofetch
```
sudo add-apt-repository ppa:dawidd0811/neofetch
```
- classicmenu-indicator
```
sudo add-apt-repository ppa:diesch/testing
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

1. Create necessary folders
```
mkdir ~/apps ~/git ~/Pictures/wallpapers ~/.fonts
```

2. Install stuff
```
sudo apt-get update
sudo apt-get install i3 vim git compton feh imagemagick lxappearance arandr arc-theme ubuntu-restricted-extras pactl pavucontrol conky htop redshift maim zsh
```

3. Set up git, clone repo, and set as working dir
```
git config --global user.name 'potateros'
git config --global user.email 'ericngu97@gmail.com'
git config --global credential.helper 'cache --timeout=3600'
git clone git://github.com/potateros/dotfiles.git ~/git/dotfiles/
cd ~/git/dotfiles
```

4. Install oh-my-zsh and copy `.zshrc` and `.vimrc` to `home`.
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.bak
mv ~/.vimrc ~/.vimrc.bak
cp .zshrc .vimrc ~/
```

5. Place `config` in `~/.config/i3/`
```
mv ~/.config/i3/config ~/.config/i3/config.bak
cp config ~/.config/i3/
```

6. Unzip and place `apps.tar.gz` in `~/apps/`
```
mkdir ~/apps/
tar -xvzf apps.tar.gz -C ~/apps/
```

7. Copy fonts
```
cp .fonts/* ~/.fonts/
```

8. Install Dropbox, VSCode, NodeJS, Anaconda
```
sudo chmod +x ~/apps/upedit.sh
sudo ~/apps/upedit.sh

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O /tmp/anaconda.sh
sudo chmod +x /tmp/anaconda.sh
sudo /tmp/anaconda.sh
```

9. Install snaps
```
sudo snap install atom --classic
sudo snap install chromium --classic
sudo snap install firefox --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install slack --classic
sudo snap install mailspring pencilsheep polarr skype spotify vlc
```

10. Get wallpapers back
- Download wallpapers and then
```
unzip file.zip -d ~/Pictures/wallpapers/
```

11. Restore VSCode settings

- `code --install-extension Shan.code-settings-sync`

- Open VSCode and set up Settings Sync

---
## To-Do

- Create a script that can automate most (if not all) of the processes above

- Test on other ubuntu-based distros

---
## Disclaimer

__Remember to change the git configurations to reflect your username and email!__

I've used this on my laptop, but I cannot guarantee it will work on yours. Please don't hate me if it doesn't. Please do let me know if it does though. Thanks ♥
