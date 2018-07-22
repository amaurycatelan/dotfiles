#!/bin/zsh
# --------------------------

# main file
# --------------------------
source ${HOME}/dotfiles/bash/.main

# autosuggestions and syntax-highlighting
# --------------------------
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# oh-my-zsh
# --------------------------
source $ZSH/oh-my-zsh.sh

# load cached file
# --------------------------
cache_shell "zsh"