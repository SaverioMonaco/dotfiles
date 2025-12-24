{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    prefix = "C-b";

    extraConfig = ''
      set -g set-clipboard on

      # --- Vim-style pane navigation ---
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # --- Splits ---
      # Vertical split (side-by-side)
      bind v split-window -h

      # Horizontal split (top/bottom)
      bind s split-window -v

      # Unbind default split keys
      unbind %
      unbind '"'
    '';
  };
}