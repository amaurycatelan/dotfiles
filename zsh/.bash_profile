# --------------------------

# GENERAL (Config) ,,
# --------------------------

dotfiles="${HOME}/dotfiles"
gdrive="${HOME}/gdrive"

# POWERLINE (Python) - iTerm2 ,,
# --------------------------

function powerline_precmd() {
  PS1="$(${dotfiles}/shell/powerline.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
   if [ "$s" = "powerline_precmd" ]; then
     return
   fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi

# ZSH (History Configuration) ,,
# --------------------------

HISTSIZE=200
SAVEHIST=200

if [ -z "$HISTFILE" ]; then
  HISTFILE=${HOME}/.zsh_history
fi

if [ -n "$ZSH_VERSION" ]; then
  setopt APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS AUTO_CD BSD_ECHO PROMPT_SUBST
  setopt append_history
  setopt inc_append_history
  setopt extended_history
  setopt hist_find_no_dups
  setopt hist_ignore_all_dups
  setopt hist_reduce_blanks
  setopt hist_ignore_space
  setopt hist_no_store
  setopt hist_no_functions
  setopt no_hist_beep
  setopt hist_save_no_dups
fi

# ZSH (Auto Suggestions, Syntax Highlighting) ,,
# --------------------------

if [ -n "$ZSH_VERSION" ]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# FZF - fuzzy finder (ZSH and BASH) ,,
# --------------------------

if [ -n "$ZSH_VERSION" ]; then [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
  elif [ -n "$BASH_VERSION" ]; then [ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
fi

# GOENV (Go) ,,
# --------------------------

function load-goenv() {
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOPATH="$HOME/go"
  eval "$(goenv init -)"
}

alias load-goenv=load-goenv

# --------------------------

# NVM (Node) ,,
# --------------------------

function load-nvm() {
  export NVM_DIR="$HOME/.nvm"
  source $(brew --prefix nvm)/nvm.sh
}

alias load-nvm=load-nvm

# --------------------------

# Extend (Shell) ,,
# --------------------------

for extend (${dotfiles}/zsh/utils/*.sh(N)); do
  if [ -f $extend ]; then
    source $extend
  fi
done

unset extend

# --------------------------