#!/bin/bash
# --------------------------

__sublime() {

  # init
  # --------------------------

  local build=3176
  local application="/Applications/Sublime Text.app"
  local settings="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
  local dotfiles="${HOME}/dotfiles/sublime"

  # parameters
  # --------------------------

  if [ "$1" = "app" ]; then
    echo "${application}"; exit
  fi

  # default
  # --------------------------

  local i=0

  find ${dotfiles} ! '(' -name '*.DS_Store' -o -name '*.sh' ')' -type f -print0 |
  while IFS= read -r -d $'\0' item; do

    local command=("${item}" "${settings}");
    echo "running #${i}: ${command[@]}"; i=$((i+1))
    cp -r "${command[@]}"; i=$((i+1))

  done

}

# alias
# --------------------------

sublime() {
  open -a "$(__sublime "app")" $1
}

# --------------------------