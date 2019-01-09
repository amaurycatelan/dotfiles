#!/bin/bash
# --------------------------

__sublime() {

  # init
  # --------------------------

  local build=3176
  local application="/Applications/Sublime Text.app"
  local settings="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
  local dotfiles="${HOME}/dotfiles/sublime/"

  local files=(
    "Preferences.sublime-settings"
    "Package Control.sublime-settings"
    "Default (OSX).sublime-keymap"
  )

  # parameters
  # --------------------------

  if [ "$1" = "app" ]; then
    echo "${application}"; exit
  fi

  # default
  # --------------------------

  local i=0

  for item in "${files[@]}"; do
    local command=("${dotfiles}${item}" "${settings}");
    echo "running #${i}: $command";
    cp -r "${command[@]}"; i=$((i+1))
  done

}

# alias
# --------------------------

sublime() {
  open -a "$(__sublime "app")" $1
}

# --------------------------