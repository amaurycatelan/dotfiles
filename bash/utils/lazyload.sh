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