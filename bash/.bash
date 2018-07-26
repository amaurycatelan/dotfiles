#!/bin/bash
# --------------------------

# main file
# --------------------------
source ${HOME}/dotfiles/bash/.main

# bash settings
# --------------------------
source ${HOME}/dotfiles/bash/.settings

# load cached file
# --------------------------
cache_shell "sh"

# fuzzy finder
# --------------------------
source $HOME/.fzf.bash