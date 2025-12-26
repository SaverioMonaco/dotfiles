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

      # Setup 'v' to begin selection as in Vim
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

      # Update default binding of `Enter` to also use copy-pipe
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
    '';
  };
}