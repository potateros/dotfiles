export ZSH="/home/potateros/.oh-my-zsh"
ZSH_THEME="arrow"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=30
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git k)
source $ZSH/oh-my-zsh.sh

# User configuration

GPG_TTY=$(tty)
export GPG_TTY

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ls="ls -F"
alias l="k -h -a"
alias mkcd="mkdir $1 && cd $1"

alias py="python3"

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Loads NVM
export NVM_DIR="/Users/chngu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Generates gitingore file
function gi() { curl -L -s https://www.gitignore.io/api/$0 ;}
