# --------------------------

# ALIAS (Shell) ,,
# --------------------------

# personal settings
alias gc="python ${gdrive}/root/projects/lab/git-helper/gclone.py"
alias wn="sh ${gdrive}/root/projects/lab/typewriter/main.sh"

# directory navigation
alias cl="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

# always recursive and verbose
alias cp="cp -rv"
alias rm="rm -rv"
alias mv="mv -v"

# list all files colorized in long format
alias l="ls -l -G"
alias ls-a="ls -a -G"
# list all files colorized in long format, including dot files
alias la="ls -la -G"
# list only directories
alias lsd='ls -l -G | grep "^d"'
# always use color output for `ls`
alias ls="command ls -G"

# process status
alias psa="ps aux"
alias psag="ps aux | ag "

# easy folder and file loading
alias apps="cd /Applications"
alias finder="open . -a finder.app"

# clean up .DS_Store files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# file size
alias fs="stat -f \"%z bytes\""

# show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# hide/show desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# network
alias my-ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"

# view HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# --------------------------