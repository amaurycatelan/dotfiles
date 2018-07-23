# --------------------------

# LAZYLOAD ,,
# --------------------------

# GOENV (Go) ,,
# --------------------------

function load-goenv() {
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOPATH="$HOME/go"
  eval "$(goenv init -)"
}

alias load-goenv=load-goenv

# NVM (Node) ,,
# --------------------------

function load-nvm() {
  export NVM_DIR="$HOME/.nvm"
  source $(brew --prefix nvm)/nvm.sh
}

alias load-nvm=load-nvm

# --------------------------