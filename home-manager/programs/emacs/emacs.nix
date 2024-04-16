{pkgs, inputs, config, ... }:
let 
  my_emacs = pkgs.emacsWithPackagesFromUsePackage {
    config = ./init.el;
    defaultInitFile = true;
    package = pkgs.emacs29;
    alwaysEnsure = true;
    alwaysTangle = true;
  };
in
{
  services.emacs = {
    enable = true;
    package = my_emacs;
  };

  home.file.".emacs.d/init.el".source = ./init.el;
}
