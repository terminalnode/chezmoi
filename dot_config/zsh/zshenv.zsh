export TMPDIR="$HOME/.local/tmp"

source "$HOME/.config/zsh/zshenv-xdg.zsh"

# Default applications
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="vivaldi"
export TERMINAL="foot"

# Path
export PATH="$XDG_DATA_HOME/node_modules/bin:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/jetbrains-bin:$PATH"

# Kubernetes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export KUBECONFIG=$HOME/.kube/config

# GUI
export QT_QPA_PLATFORM="wayland-egl"
export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_WAYLAND_FORCE_DPI=physical
export CLUTTER_BACKEND=wayland

# Misc
[ -d "$HOME/.local/share/cargo/env" ] && source "$HOME/.local/share/cargo/env"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Hotfix for ZSH rsync autocompletion
# See: https://www.zsh.org/mla/workers/2022/msg00820.html
export RSYNC_OLD_ARGS=1

# Opt out of Microsoft spyware
export DOTNET_CLI_TELEMETRY_OPTOUT="1"
