{ pkgs, inputs, config, ... }:
 {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
    extraPackages = epkgs : [
      epkgs.evil
      epkgs.evil-collection
    ];
  };

  home.file.".emacs.d" = {
    source = ./emacs.d;
    recursive = true;
  };
}
