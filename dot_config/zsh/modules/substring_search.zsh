# Activates zsh substring search if it exists
arch_path="/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
loaded=false

# Load script
if [[ -r "${arch_path}" ]] ; then
  source "${arch_path}"
  loaded=true
fi

# Configure script
if $loaded; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

bindkey '^R' history-incremental-search-backward
