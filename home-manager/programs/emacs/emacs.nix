{ pkgs, inputs, config, ... }:
let
  config.el = file: ''
    ${builtins.concatStringsSep "\n" (map builtins.readFile [
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/init.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-bindings.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-counsel.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-layout.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-session.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-theme-light.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-colors.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-defaults.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-minibuffer.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-splash.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-writer.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-agenda.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-command.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-faces.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-modeline.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-theme-dark.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-writer.org"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-base-colors.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-compact.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-help.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-mu4e.el"
      "/home/iluvshiwoon/nix-config/home-manager/programs/emacs/nano-emacs/nano-theme.el"
    ])}
    EOF
  '';
  my_emacs = pkgs.emacsWithPackagesFromUsePackage {
    config = config.el;
    # ./emacs.d/init.el;
    defaultInitFile = true;
    package = pkgs.emacs29;
    alwaysEnsure = true;
    alwaysTangle = true;
  };
in {
  programs.emacs = {
    enable = true;
    package = my_emacs;
    # extraConfig = 
  };

  home.file.".emacs.d" = {
    source = ./emacs.d;
    recursive = true;
  };
}
