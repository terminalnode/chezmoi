# FILE OPERATIONS
alias ls="ls -Fh --group-directories-first --color"
alias ll="ls -l"
alias l1="ls -1"

alias exa="exa --group-directories-first --git --time-style long-iso"
alias e="exa"
alias el="exa -l"
alias e1="exa -1"

# LAPTOP BRIGHTNESS
alias brightness-max="echo 255 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"
alias brightness-mid="echo 180 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"
alias brightness-low="echo 100 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"
alias brightness-min="echo 1 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"

# SHORTCUTS
alias dcdu="docker-compose down; docker-compose up"
alias ncp="ncpamixer"
alias tf="terraform"
alias tf-fmt="terraform fmt -recursive ."
alias ytdl="yt-dlp"
alias pldl="yt-dlp -o '~/video/ytdl/%(uploader)s_%(playlist)s/%(playlist_index)s_%(title)s.%(ext)s'"
alias svtdl="svtplay-dl"
alias q="exit"
alias cm="chezmoi"

# GIT
alias gits="git status"
alias gita="git add"
alias gitb="git branch"
alias gitc="git commit -m"
alias gitl="git log --oneline"
alias gitp="git push"
alias gitd="git diff"
alias gitr="git rebase"
alias gco="git checkout"
alias git-message="git show -s --format=%B" # followed by commit hash/HEAD

# ADD OPTIONS
# Commands replaced with themselves + various options.
alias df="df -h"
alias diff="diff --color=auto"
alias du="du -h"
alias free="free -ht"
alias grep="grep --color=auto"
alias mpv="mpv --audio-display=no"
alias tmux="tmux -f '$XDG_CONFIG_HOME/tmux/tmux.conf'"

# NETWORKING
alias p9="ping -c 3 9.9.9.9"
alias pdns="ping -c3 archlinux.org"
alias pdns4="ping -4 -c3 archlinux.org"
alias pdns6="ping -6 -c3 archlinux.org"
alias publicip="curl ifconfig.me"

# COOL STUFF
alias systemage="head -n1 /var/log/pacman.log | awk '{ print \$1, \$2 }'"
alias demoterm="setopt interactivecomments && export PS1=\"%B%F{cyan}$ %f%b\" && clear"
