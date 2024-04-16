#!/bin/sh
export NIXPKGS_ALLOW_UNFREE=1

NIX=$HOME/nix-portable

export TERM=xterm-256color
export PATH=$HOME/.nix-profile/bin:$PATH

#fix double char
export LANG=C.UTF-8

$NIX nix-shell -p nix --command "nix run --impure github:guibou/nixGL -- emacs"
