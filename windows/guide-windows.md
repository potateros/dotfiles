# Windows 10

This guide is to set up a Windows 10 dev environment. The main star of the show
here will be WSL, which stands for Windows Subsystem on Linux. WSL allows Linux
to run natively on Windows (that means all the Unix tools too!) and is basically
just a Linux distro running alongside Windows.

This means that many of the gap between macOS and Windows for a great dev
experience has been closed. For example, Ruby will no longer be a headache on
Windows!

## Setting up Windows & Preparing for WSL

To get started, we will install all the useful tools to make our experience
better. The tools here installed will be minimal, as the focus will be for WSL.
The aim is to start developing as soon as possible while having a decent
experience.

Follow the up-to-date instructions in this [https://docs.microsoft.com/en-us/windows/wsl/install-win10](link on Microsoft's website). Make sure to install Windows Terminal as well, it has the
best terminal experience on Windows.

The font Cascadia Code should already be installed when you install Windows
Terminal. If not, install it [here](https://github.com/microsoft/cascadia-code/releases).

### Setting Up Windows Terminal

Once installed, be sure to change your Windows Terminal settings. Personally, the
first thing I do is to change the default terminal on startup to Ubuntu. You can
do that by changing Windows Terminal settings and replacing `{your WSL guid}`:

```
...
{
    "$schema": "https://aka.ms/terminal-profiles-schema",

    "defaultProfile": "{your WSL guid}",
...
```

You can find your WSL GUID by scrolling down and checking out what the `"guid"`
value is. It should be listed together with an object with `"source": "Windows.Terminal.Wsl"`
key-value pair.

## Setting up WSL

Once Ubuntu (or any other distro, but the focus here is for Ubuntu) is properly
installed and a user and password is set up, you should be presented with the
bash prompt. If all goes well, start by running these commands:

1. Update apt with
    ```
    sudo apt update
    ```
2. Upgrade installed packages with
    ```
    sudo apt upgrade
    ```
3. Set up Zsh
    1. Install Zsh by running
        ```
        sudo apt install zsh
        ```
    2. Run
        ```
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        ```
    3. Set up your `~/.zshrc` file.

### Installing Homebrew

Homebrew is a package manager which is extremely popular on macOS. It is only
available on macOS and Linux. Thankfully, you already have Linux on your
Windows install through WSL.

If you have been using macOS as your main dev environment, it should be familar
to you. Install Homebrew by running this command in your WSL terminal.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

You should have the `brew` command installed now.

### Installing Ruby Version Manager (RVM)

The instructions below are from the rvm [website](http://rvm.io/).

- Install GPG keys:
    ```
    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    ```
- Install RVM:
    ```
    \curl -sSL https://get.rvm.io | bash -s stable
    ```
- For installing RVM with default Ruby and Rails in one command, run:
    ```
    \curl -sSL https://get.rvm.io | bash -s stable --rails
    ```

### Installing Node Version Manager (NVM)

The instructions are from the NVM [GitHub repository](https://github.com/nvm-sh/nvm)

1. Run the NVM install script
    ```
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
    ```
2. Add NVM to your `.zshrc`
    ```
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    ```

Restart your terminal, or open a new one, then run `nvm -v`. If it works, you have
NVM installed.

If you have any issues, check out the [NVM repository](https://github.com/nvm-sh/nvm).

### Installing Golang binaries

Get the latest Golang binaries *for Linux* from the [website](https://golang.org/dl/).

Then, `cd` to where you have downloaded the Golang `.tar.gz` file. Make sure it
is for Linux.

If you have a previous version of Go installed, be sure to remove it before installing another.

1. Download the archive and extract it into /usr/local, creating a Go tree in /usr/local/go. For example, run the following as root or through sudo:
    ```
    tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
    ```
2. Add /usr/local/go/bin to the PATH environment variable. You can do this by adding the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):
    ```
    export PATH=$PATH:/usr/local/go/bin
    ```
    Note: Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source $HOME/.profile.

3. Verify that you've installed Go by opening a command prompt and typing the following command: `go version`
4. Confirm that the command prints the installed version of Go.



## Setting Up the Rest of Windows

Now that a minimal dev environment has been set up, it's time to install the
remaining applications and tools to ramp up your Windows install to a full
productive environment.

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
kubernetes-cli \
nvm \
postgresql \
ranger \
redis \
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
iterm2 \
jetbrains-toolbox \
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
