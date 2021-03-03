## guide-post.md

This guide is assuming you have all the basics such as Homebrew, Homebrew apps, ZSH, and .vimrc and .zshrc copied and setup.

This guide contains steps for:

- Installing ZSH Extensions
- Generating SSH keys
- Generating GPG keys

### Installing ZSH Extensions

Add downloaded ZSH extensions by adding the folder name to the line `plugins=()`. Add multiple by separating with a space. For example, with git and zsh-autosuggestions, it will become `plugins=(git zsh-autosuggestions)

- zsh-autosuggestions `$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

### Generating and adding your SSH key to Gitlab and GitHub (macOS, Linux, or WSL only)

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

### Generating and adding your GPG key to Gitlab, GitHub, or whatever

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



