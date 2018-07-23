# --------------------------

# VIM ,,
# --------------------------

function vi() {
  itermcol=$(stty size | cut -d ' ' -f 2) &&
  stty columns 120 &&
  /usr/local/opt/ex-vi/bin/vi &&
  stty columns ${itermcol}
}

alias vi=vi
alias vim=/usr/local/opt/vim/bin/vim
alias neovim=/usr/local/opt/neovim/bin/nvim