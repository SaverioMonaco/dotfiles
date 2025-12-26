{ pkgs, ... }:
{
  # Add nerd-fonts for neovim
  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
}