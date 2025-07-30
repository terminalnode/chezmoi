# FILE OPERATIONS
alias ls="ls -Fh --group-directories-first --color"
alias ll="ls -l"
alias l1="ls -1"

alias eza="eza --group-directories-first --git --time-style long-iso"
alias e="eza"
alias el="eza -l"
alias e1="eza -1"

alias mv="mv -i"

# LAPTOP BRIGHTNESS
alias brightness-max="echo 255 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"
alias brightness-mid="echo 180 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"
alias brightness-low="echo 100 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"
alias brightness-min="echo 1 | sudo tee /sys/class/backlight/amdgpu_bl1/brightness"

# SHORTCUTS
alias cm="chezmoi"
alias cmlg='lazygit -p "$(chezmoi source-path)"'
alias d="docker"
alias dcdu="docker-compose down; docker-compose up"
alias k="kubectl"
alias ncp="ncpamixer"
alias tf="terraform"
alias tf-fmt="terraform fmt -recursive ."
alias pldl="yt-dlp -o '~/video/ytdl/%(uploader)s_%(playlist)s/%(playlist_index)s_%(title)s.%(ext)s'"
alias q="exit"
alias svtdl="svtplay-dl"
alias ytdl="yt-dlp"

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

# Make it long and clear, but easily auto-completable
# Beats typing out the whole thing :-)
alias gitp-force="git push --force-with-lease"

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
pdns_url="archlinux.org"
alias p1="ping -c 3 1.1.1.1"
alias p8="ping -c 3 8.8.8.8"
alias p9="ping -c 3 9.9.9.9"
alias pdns="ping -c3 $pdns_url"
alias pdns4="ping -4 -c3 $pdns_url"
alias pdns6="ping -6 -c3 $pdns_url"
alias publicip="curl ifconfig.me"

# COOL STUFF
alias systemage="head -n1 /var/log/pacman.log | awk '{ print \$1, \$2 }'"
alias demoterm="setopt interactivecomments && export PS1=\"%B%F{cyan}$ %f%b\" && clear"
