########## zshrc for both WSL2 (Ubuntu) and macOS #####
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions)
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
ssh-add ~/.ssh/id_ed25519

###Linux-only initialization (tested on WSL2 Ubuntu)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # homebrew
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

########## fasd #####
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

########## Aliases #####
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

alias l="exa --oneline"
alias ls="exa --long --classify --group-directories-first"
alias la="exa --long --classify --all"
alias lt="exa --long --classify --tree --level 2"
alias lsize="exa --long --classify --sort size --reverse"

###make directory then cd in
function mkcd() { mkdir -p $1 && cd $1 }

###change mac address for unlimited limited wifi
function changeMac() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}

########## PATHs #####
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  export GPG_TTY=$(tty)
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

########## Git helpers
###prints all local branches with deleted remotes
alias git_prune_print="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}'"
###deletes all local branches with deleted remotes
alias git_prune="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -d"
###generates gitignore files from that website
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$1 ;}
###goes into each directory (of depth 1) and deletes all local branches with deleted remotes
function loopdir () { find . -maxdepth 1 -type d \( ! -name . \) -exec zsh -c "cd '{}' && $1" \;}

########## Node-specific
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

########## Ruby-specific
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH="$PATH:$HOME/.rvm/bin"

########## Java-specific
eval "$(jenv init -)"
jenv global 11
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
alias mvncompile="mvn clean compile && mvn package"

########## Postgres-specific
###Loads postgresql@12 installed by homebrew (v12 for compatibility)
# export PATH="$PATH:/usr/local/opt/postgresql@12/bin"

########## Secrets
# alias hubb=$HOME/git/
# export API_KEY_RESCUETIME_GIT=
# HUBBLE_CLUSTER_NAME=

########## Hubble-specific #####
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#   # For WSL only (clip.exe is the Windows clipboard)
#   alias kubetoken="aws eks get-token --cluster-name=${HUBBLE_CLUSTER_NAME} | jq .status.token | sed 's/\"//g' | clip.exe"
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#   alias kubetoken="aws eks get-token --cluster-name=${HUBBLE_CLUSTER_NAME} | jq .status.token | sed 's/\"//g' | pbcopy"
# fi

########## Startup :D ######
fortune | cowsay -f bud-frogs | lolcat
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
