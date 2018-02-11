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

  HISTSIZE=300
  SAVEHIST=300
  HISTFILE=${gdrive}/"root/settings/history"/.zsh_history

  # HISTORIC (script for backup history)
  # --------------------------

  HISTORIC_PATH=${gdrive}/"root/settings/history/backup"/
  HISTORIC_NAME=".history-"$(date +%Y%m)
  HISTORIC_FILE=${HISTORIC_PATH}${HISTORIC_NAME}
  HISTORIC_FIND=$(find $HISTORIC_PATH -name '.history-*' -type f | tail -1)

  historic_write() {
    historic_stamp=$(tail -1 $HISTORIC_FIND | cut -c 1-13 | grep -o -E '[0-9]+')
    historic_linenumber=$(grep -n "^: $historic_stamp" $HISTFILE | head -1 | grep -Eo '^[^:]+' | awk '{ print $1+1 }')

    if [ $1 = "append" ]; then
      sed -n ''$historic_linenumber',$p' $HISTFILE >> $HISTORIC_FILE
    else
      sed -n ''$historic_linenumber',$p' $HISTFILE > $HISTORIC_FILE
    fi
  }

  historic_fill() {
    mkdir -p $HISTORIC_PATH
    cat $HISTFILE > $HISTORIC_FILE
  }

  if [ ! -f "$HISTORIC_FILE" ]; then

    if [ ! -d "$HISTORIC_PATH" ]; then
      historic_fill
    else

      if [ $HISTORIC_FIND ]; then
        historic_write
      else
        historic_fill
      fi

    fi

  else
    historic_write "append"
  fi

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

# SHELL disable hidden ._ files in archives
# --------------------------

export COPYFILE_DISABLE=true

# ZSH fix: pasting commands from clipboard are slow
# --------------------------

if [ -n "$ZSH_VERSION" ]; then
  zstyle ':bracketed-paste-magic' active-widgets '.self-*'
fi

# Extend (Shell) ,,
# --------------------------

for extend in ${dotfiles}/zsh/utils/*.sh; do
  if [ -f $extend ]; then
    source $extend
  fi
done

unset extend

# --------------------------