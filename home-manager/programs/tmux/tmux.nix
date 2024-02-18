{config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
     {
      plugin = tmuxPlugins.vim-tmux-navigator;
    }
    ];
    extraConfig = "
    set -g default-shell ${pkgs.zsh}/bin/zsh
    set -ag terminal-overrides ',xterm-256color:RGB'
    set  -g default-terminal 'tmux-256color'

    set -g prefix C-a
    unbind C-b
    bind-key C-a send-prefix

    unbind %
    bind | split-window -h

    unbind '\"'
    bind - split-window -v

    unbind r
    bind r source-file ~/.config/tmux/tmux.conf

    bind -r j resize-pane -D 5
    bind -r k resize-pane -U 5
    bind -r l resize-pane -R 5
    bind -r h resize-pane -L 5

    bind -r m resize-pane -Z

    ";
  };
}
