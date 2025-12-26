{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./tmux.nix
    ./foot.nix
    ./zsh.nix
    ./oh-my-posh.nix
    ./yazi.nix
  ];

  # Add nerd-fonts for neovim
  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}