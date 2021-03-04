##### zshrc for both linux and macOS

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions fasd)

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

##### User configuration

GPG_TTY=$(tty)
export GPG_TTY

# aliases
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

alias l="exa"
alias ls="exa --long --classify --group-directories-first"
alias la="exa --long --classify --all"
alias lt="exa --long --classify --tree --level 2"
alias lsize="exa --long --classify --sort size --reverse"

alias mkcd="mkdir $1 && cd $1"

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

##### Hubble-specific
alias hubb="cd $HOME/git/hubble-sg/hubble_modular_api"
HUBBLE_CLUSTER_NAME=eks-prod-cluster
alias kubetoken="aws eks get-token --cluster-name=${HUBBLE_CLUSTER_NAME} | jq .status.token | sed 's/\"//g' | clip.exe"

#source /home/potateros/.config/broot/launcher/bash/br
