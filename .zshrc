export ZSH="/Users/chngu/.oh-my-zsh"
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

# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ls="ls -F"
alias l="k -h -a"
alias mkcd="mkdir $1 && cd $1"

alias py="python3"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Generates gitingore file
function gi() { curl -L -s https://www.gitignore.io/api/$0 ;}

# Loads nvm
export NVM_DIR="/Users/chngu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Loading secrets
# remember to set up secrets file
SECRETS_FILE=~/.secrets.sh
GPG_ID=cheehongngu@gmail.com
profile_decrypt (){
  gpg -d ${SECRETS_FILE}.asc > ${SECRETS_FILE} # Decrypt file
  rm ${SECRETS_FILE}.asc
}
profile_encrypt () {
  gpg -ea -r ${GPG_ID} ${SECRETS_FILE} # Encrypt file using ascii output
  rm ${SECRETS_FILE}
}
profile_decrypt
source $SECRETS_FILE
profile_encrypt

alias kubetoken="aws eks get-token --cluster-name=${HUBBLE_CLUSTER_NAME} --role-arn ${HUBBLE_ROLE_ARN} | jq .status.token | sed 's/\"//g' | pbcopy"
