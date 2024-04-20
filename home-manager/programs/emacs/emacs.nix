{ pkgs, inputs, config, ... }:
 {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
    extraPackages = epkgs : [
      epkgs.evil
      epkgs.evil-collections
    ];
  };

  home.file.".emacs.d" = {
    source = ./emacs.d;
    recursive = true;
  };
}
