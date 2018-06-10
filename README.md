# dotfiles

Configuration files for my Ubuntu install

(For step-by-step, I've added to [ubuntu.md](./ubuntu.md))

(I don't use i3wm currently, so check out my i3 steps [here](./i3wm.md)

(Tested on Xubuntu and Ubuntu, not sure about others)

- `.fonts/` are fonts that I use for both UI and editors

- `.vim/colors/monokai.vim` is my modified color scheme for vim

- `bin/` contains bash scripts that I make executable and added to PATH

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

---

## To-Do

- Create a script that can automate most (if not all) of the processes above

- Test on other ubuntu-based distros

- Find a better screenshot tool

---

## Disclaimer

__Remember to change the git configurations to reflect your username and email!__

I've used this on my laptop, but I cannot guarantee it will work on yours. Please don't hate me if it doesn't. Please do let me know if it does though. Thanks ♥
