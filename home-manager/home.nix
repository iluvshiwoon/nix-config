# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./scripts
    ./shell
    ./programs
    ./modules
    ./theme
    inputs.nix-colors.homeManagerModules.default
    inputs.prism.homeModules.prism
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.emacs-overlay.overlays.package
      inputs.emacs-overlay.overlays.emacs

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "iluvshiwoon";
    homeDirectory = "/home/iluvshiwoon";
  };

  # Add stuff for your user as you see fit:

  colorScheme = inputs.nix-colors.colorSchemes.kanagawa;
  home.packages = with pkgs; [
    nix-prefetch
    nixfmt
    ccls
    glslang
    multimarkdown
    shellcheck
    nodejs_21
    telegram-desktop
    vivaldi
    cool-retro-term
    cmake
    gnumake
    llvmPackages_latest.libcxxClang
    llvmPackages_latest.libcxx
    libtool
    tree
    brightnessctl
    unzip
    jdk17
    ripgrep
    coreutils
    fd
    bitwise # cli tool for bit / hex manipulation
    eza # ls replacement
    entr # perform action when file change
    file # Show file information
    fzf # fuzzy finder
    jdk17 # java
    lazygit
    libreoffice
    nitch # systhem fetch util
    nix-prefetch-github
    pipx # Install Python applications in isolated environments
    prismlauncher # minecraft launcher
    ripgrep # grep replacement
    rnix-lsp
    soundwireserver # pass audio to android phone
    todo # cli todo list
    toipe # typing test in the terminal
    cinnamon.nemo-with-extensions # file manager
    yazi # terminal file manager
    youtube-dl
    gnome.zenity

    bleachbit # cache cleaner
    cmatrix
    gparted # partition manager
    ffmpeg
    imv # image viewer
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    openssl
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    playerctl # controller for media players
    qalculate-gtk # calculator
    unzip
    wget
    xdg-utils
    valgrind
    xorg.xwininfo
    bc
    norminette
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
