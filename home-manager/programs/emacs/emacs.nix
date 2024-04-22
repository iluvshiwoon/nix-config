{ pkgs, inputs, config, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
    extraPackages = epkgs: with epkgs; [ evil evil-collection ];
  };

  home.file = {
    ".emacs.d" = {
      source = ./emacs.d;
      recursive = true;
    };
    ".emacs.d/nano-emacs" = {
      source = builtins.fetchGit {
        url = "https://github.com/rougier/nano-emacs";
        rev = "b8631088220dbbcd885ad1353bdc52b569655f85";
      };
    };
  };
}
