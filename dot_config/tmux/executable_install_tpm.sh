#!/bin/bash
plugdir="$HOME/.config/tmux/plugins"
mkdir -p "$plugdir"

if [ ! -d "${plugdir}/tpm" ]; then
  echo "TPM is not installed, installing..."
  git clone https://github.com/tmux-plugins/tpm "${plugdir}/tpm"
fi
