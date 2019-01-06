#!/bin/bash
# --------------------------

launchers() {

  ln -sf "$DOTFILES/launchers/com.user.EnpassLauncher.plist" "$HOME/Library/LaunchAgents"
  ln -sf "$DOTFILES/launchers/com.user.EnpassLauncher" "/Library/.settings/launchers"

}

# --------------------------