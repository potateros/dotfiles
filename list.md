### Things needed for i3wm to work properly

#### Available in default Ubuntu PPA
```
i3
thunar
vlc browser-plugin-vlc
playerctl
compton
scrot
imagemagick

``` 
---
#### Available on GitHub

[Font-Awesome](https://github.com/FortAwesome/Font-Awesome/releases)
[Arc-theme](https://github.com/horst3180/Arc-theme)

---
### Needs more steps
- Spotify
```
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client
```

### Download .deb packages
- VSCode
- Slack
