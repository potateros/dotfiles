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

## Brew

```bash
brew install \
bat \
coreutils \
derailed/k9s/k9s \
firebase-cli \
gnupg \
golang \
htop \
imagemagick \
kubernetes-cli \
nvm \
ranger \
tldr \
wget \
yarn
```
## Setting Up the Rest of Windows

Now that a minimal dev environment has been set up, it's time to install the
remaining applications and tools to ramp up your Windows install to a full
productive environment.


Then, set up ZSH and env stuff in [./guide-post.md](guide-post.md)
