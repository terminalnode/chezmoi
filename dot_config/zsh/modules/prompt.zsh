# Used to be the most exciting part of this whole thing, but now it just loads starship.

if [[ -x $(command -v starship) ]]; then
  eval "$(starship init zsh)"

else
  # Looks something like this:
  # [user@host ~/working_directory]
  # >

  # Load VCS info so we can add git branch info to RPROMPT
  autoload -Uz vcs_info
  precmd() { vcs_info }
  zstyle ':vcs_info:git:*' formats '%b'
  setopt PROMPT_SUBST

  # Exit status shows a red warning if previous exit status was unsuccessful
  exit_status="%(?..%B%F{red}[!] %f%b)"

  p_bracket1="%B%F{green}[%b%f" # bold green [
  p_bracket2="%B%F{green}]%b%f" # bold green ]
  p_user="%F{cyan}%n%f"         # cyan       user name
  p_host="%F{blue}%M%f"         # blue       host name
  p_atsign="%B%F{green}@%f%b"   # bold green @
  p_path="%F{yellow}%~%f"       # yellow     working directory
  p_prompt="%B%F{8}> %f%b"      # dark grey  >
  p_nl=$'\n'                    # new line

  PROMPT="${p_nl}${exit_status}${p_bracket1}${p_user}${p_atsign}${p_host} ${p_path}${p_bracket2}"
  PROMPT="${PS1}${p_nl}${p_prompt}"
  RPROMPT='%F{magenta}${vcs_info_msg_0_}%f'
fi
