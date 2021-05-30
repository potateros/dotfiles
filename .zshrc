##### zshrc for both linux and macOS
# comment out as needed

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

##### Linux-only lines (tested on Ubuntu)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # homebrew
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
##### macOS-only lines
if [[ "$OSTYPE" == "darwin"* ]]; then
  #Loads postgresql@12 installed by homebrew (v12 for compatibility)
  export PATH="$PATH:/usr/local/opt/postgresql@12/bin"
fi

###### User configuration

GPG_TTY=$(tty)
export GPG_TTY

# aliases
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

alias l="exa --one-line"
alias ls="exa --long --classify --group-directories-first"
alias la="exa --long --classify --all"
alias lt="exa --long --classify --tree --level 2"
alias lsize="exa --long --classify --sort size --reverse"

alias mkcd="mkdir $1 && cd $1"

alias git_prune="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -d"

# fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# functions
function gi() { curl -L -s https://www.gitignore.io/api/$0 ;} # generates gitignore files from that website

# PATHs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

##### Linux-only lines (tested on Ubuntu)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  #source /home/potateros/.config/broot/launcher/bash/br
  export PATH="/home/linuxbrew/.linuxbrew/opt/imagemagick@6/bin:$PATH"
  PATH="$HOME/.local/bin:$PATH"

  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else [[ "$OSTYPE" == "darwin"* ]];
  export PATH="$PATH:$HOME/.rvm/bin"
fi


##### Hubble-specific
alias hubb=
HUBBLE_CLUSTER_NAME=

# For WSL or macOS (main dev envs)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias kubetoken="aws eks get-token --cluster-name=${HUBBLE_CLUSTER_NAME} | jq .status.token | sed 's/\"//g' | clip.exe"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias kubetoken="aws eks get-token --cluster-name=${HUBBLE_CLUSTER_NAME} | jq .status.token | sed 's/\"//g' | pbcopy"
fi

# Env keys
API_KEY_RESCUETIME_GIT=
