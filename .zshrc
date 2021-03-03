##### zshrc for both linux and macOS
# comment out as needed
ZSH_DISABLE_COMPFIX="true"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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

# functions
function gi() { curl -L -s https://www.gitignore.io/api/$0 ;} # generates gitignore files from that website

# PATHs

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

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

##### hubb-specific
alias hubb="cd $HOME/git/"
alias kubetoken="aws eks get-token --cluster-name=eks-prod-cluster | jq .status.token | sed 's/\"//g' | clip.exe"
