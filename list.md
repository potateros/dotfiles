### Things needed for i3wm to work properly

#### Available in default Ubuntu PPA
```
i3
thunar
vim
vlc browser-plugin-vlc
git
compton
feh
scrot
imagemagick
lxappearance
arandr
arc-theme
ubuntu-restricted-extras
pactl
pavucontrol
gnome-tweak-tool
conky

``` 
---
#### Available on GitHub

[Font-Awesome](https://github.com/FortAwesome/Font-Awesome/releases)
[Arc-theme](https://github.com/horst3180/Arc-theme)

---
### Needs more steps
- Spotify
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
```
- f.lux
```
sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1
cd /tmp
git clone "https://github.com/xflux-gui/xflux-gui.git"
cd xflux-gui
python download-xflux.py
sudo python setup.py install
fluxgui
```
- neofetch
```
sudo add-apt-repository ppa:dawidd0811/neofetch
```
- classicmenu-indicator
```
sudo apt-add-repository ppa:diesch/testing
```
- [Volume Controls](https://github.com/hastinbe/i3-volume)

- [Brightness Control using xbright](https://github.com/snobb/xbright)

### Download .deb packages
- [VSCode](https://code.visualstudio.com/)
- [Slack](https://downloads.slack-edge.com/linux_releases/slack-desktop-2.5.2-amd64.deb)
- [GitKraken](https://www.gitkraken.com/download/linux-deb)
- [Whatever(Evernote Client)](https://github.com/CellarD0-0r/whatever/releases)
- [playerctl](https://github.com/acrisci/playerctl/releases)

