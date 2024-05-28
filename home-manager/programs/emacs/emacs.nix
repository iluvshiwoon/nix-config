{ config, pkgs, inputs,... }: {
  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
  };
}
