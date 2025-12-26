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
}