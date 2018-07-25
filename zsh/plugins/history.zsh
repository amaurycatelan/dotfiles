# --------------------------

# zsh hitory options
# --------------------------

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
HISTFILE="${GDRIVE}/root/settings/history/.zsh_history"

# HISTORIC
# script for backup zsh history
# --------------------------
# --------------------------

HISTORIC_PATH="${GDRIVE}/root/settings/history/backup/"
HISTORIC_NAME=".history-"
HISTORIC_FILE=${HISTORIC_PATH}${HISTORIC_NAME}$(date +%Y%m)
HISTORIC_FIND=$(find $HISTORIC_PATH -name ${HISTORIC_NAME}'*' -type f | tail -1)
HISTORIC_FILL=5

historic_write() {
  historic_lines=$(wc -l $HISTFILE | grep -o -E '[0-9]+')
  historic_stamp=$(tail -1 $HISTORIC_FIND | cut -c 1-13 | grep -o -E '[0-9]+')
  historic_linenumber=$(grep -n "^: $historic_stamp" $HISTFILE | head -1 | grep -Eo '^[^:]+' | awk '{ print $1+1 }')

  if [ ${#historic_linenumber} -ge 1 ]; then
    mkdir -p $HISTORIC_PATH
    sed -n ''$historic_linenumber',$p' $HISTFILE >> $HISTORIC_FILE
  else

    if [ $historic_lines -gt $HISTORIC_FILL ]; then
      tail -$HISTORIC_FILL $HISTFILE >> $HISTORIC_FILE
    else
      cat $HISTFILE >> $HISTORIC_FILE
    fi

  fi
}

if [ -f "$HISTFILE" ]; then
  historic_write
else
  echo 'HISTFILE (file) is required to run the script'
fi

historic() {
  if [ "$(fzf --version)" ] ; then
    cat $( find $HISTORIC_PATH -name ${HISTORIC_NAME}'*' ) | \
    fzf --height 40% | cut -c 16- | pbcopy | </dev/null
  else
    cat $( find $HISTORIC_PATH -name ${HISTORIC_NAME}'*' ) | \
    grep --color=always "$*"
  fi
}

fzf-historic() {
  if [ "$(fzf --version)" ] ; then
    local selected num
    setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
    selected=( $( cat $( find $HISTORIC_PATH -name ${HISTORIC_NAME}'*' ) |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
    local ret=$?
    if [ -n "$selected" ]; then
      num=$selected[1]
      if [ -n "$num" ]; then
        LBUFFER+=$(echo "$selected" | cut -c 16- | </dev/null)
      fi
    fi
    zle redisplay
    typeset -f zle-line-init >/dev/null && zle zle-line-init
    return $ret
  fi
}

zle -N fzf-historic
bindkey '^W' fzf-historic

# --------------------------