autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' menu select
zmodload zsh/complist

# Load dotfile completions
fpath=("$ZDOTDIR/completions" $fpath)
[ -d "$ZDOTDIR/completions.local" ] \
  && fpath=("$ZDOTDIR/completions.local" $fpath)

# Scaleway CLI autocomplete
if [[ -x $(which scw) ]]; then
  eval "$(scw autocomplete script shell=zsh)"
fi

# HCloud CLI autocomplete
if [[ -x $(which hcloud) ]]; then
  eval "$(hcloud completion zsh)"
fi

# Terraform autocomplete
if [[ -x $(which terraform) ]]; then
  complete -o nospace -C /usr/bin/terraform terraform
fi

