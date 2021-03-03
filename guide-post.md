# guide-post.md

This guide is assuming you have all the basics such as Homebrew, Homebrew apps, ZSH, and .vimrc and .zshrc copied and setup.

This guide contains steps for:

- Installing ZSH Extensions
- Generating SSH keys
- Generating GPG keys
- Configuring Git
- Installing RVM
- Installing NVM
- Installing Golang Binaries

## Installing ZSH Extensions

Add downloaded ZSH extensions by adding the folder name to the line `plugins=()`. Add multiple by separating with a space. For example, with git and zsh-autosuggestions, it will become `plugins=(git zsh-autosuggestions)

- zsh-autosuggestions `$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

## Generating and adding your SSH key to Gitlab and GitHub (macOS, Linux, or WSL only)

1. Create an SSH key by running `$ ssh-keygen -t ed25519 -C "your_email@example.com"`.
2. Choose default for location, then enter a secure passphrase.
3. Start `ssh-agent` by running `$ eval "$(ssh-agent -s)"`
4. (macOS 10.12 or later) You'll need to configure SSH to load keys automatically. Check if config exists `$ open ~/.ssh/config`. If not, create it `$ touch ~/.ssh/config`.
5. Open your `~/.ssh/config` file and paste this into the file.
    ```
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
    ```
6. Add your SSH key `$ ssh-add ~/.ssh/id_ed25519`. If you are using macOS, add the `-K` flag, `$ ssh-add -K ~/.ssh/id_ed25519`. You'll be prompted for your passphrase you used earlier.
7. Output your `id_ed25519.pub` file and copy it to clipboard. `$ cat ~/.ssh/id_ed25519`.
8. Add it to your SSH settings on Gitlab, GitHub, or whatever.

## Generating and adding your GPG key to Gitlab, GitHub, or whatever

1. Run `$ gpg --list-secret-keys --keyid-format LONG`.
2. Run `$ gpg --full-generate-key` and follow the steps to create a key.
3. Choose default for key type (RSA and RSA).
4. Choose `4096` for the keysize.
5. Choose default when prompted for 'Key is valid for?' unless you know what you are doing. Confirm with `y`.
6. Follow the rest of the prompts.
7. Ensure that your key is generated `$ gpg --list-secret-keys --keyid-format LONG`.
8. From the list of GPG keys, copy the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:
    ```
    $ gpg --list-secret-keys --keyid-format LONG
    /Users/hubot/.gnupg/secring.gpg
    ------------------------------------
    sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
    uid                          Hubot
    ssb   4096R/42B317FD4BA89E7A 2016-03-10
    ```
9. Paste the text below, substituting in the GPG key ID you'd like to use. In this example, the GPG key ID is 3AA5C34371567BD2:
    ```
    $ gpg --armor --export 3AA5C34371567BD2
    # Prints the GPG key ID, in ASCII armor format
    ```
10. Copy your GPG key, beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----`.
11. Add it to your GPG settings on wherever you are adding.

## Configuring Git

```bash
git config --global user.name 'username'
git config --global user.email 'email'
git config --global credential.helper 'cache --timeout=3600'
```

## Installing Ruby Version Manager (RVM)

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

## Installing Node Version Manager (NVM)

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

## Installing Golang binaries

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
