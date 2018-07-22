# --------------------------

# VIM ,,
# --------------------------

function vi() {
  itermcol=$(stty size | cut -d ' ' -f 2) &&
  stty columns 120 &&
  $(brew --prefix ex-vi)/bin/vi &&
  stty columns ${itermcol}
}

alias vi=vi
alias vim=$(brew --prefix vim)/bin/vim
alias neovim=$(brew --prefix neovim)/bin/nvim