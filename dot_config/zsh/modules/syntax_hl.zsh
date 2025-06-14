# Activates syntax highlighting if it exists
# Fedora and Arch installs these to different paths, so we'll check if
# either of the paths are readable files and execute the one that is.
arch_path="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fedora_path="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ -r "${arch_path}" ]] ; then
  source "${arch_path}"

elif [[ -r "${fedora_path}" ]] ; then
  source "${fedora_path}"
fi
