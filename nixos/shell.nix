{ config, pkgs, lib, inputs, ... }:
{

#shellAliases
  programs.bash.shellAliases = {
    nixswitch = "sudo nixos-rebuild switch --flake .#joker";
    nixswitchu = "sudo nixos-rebuild switch --upgrade --flake .#joker";
    nixclean = "sudo nix-collect-garbage -d";
    nixcleanold = "sudo nix-collect-garbage --delete-old";
    cleanboot = "sudo /run/current-system/bin/switch-to-configuration boot";
    mvconfs = "cp -ur ~/dotfiles/config/* ~/.config/";
};
  # starship
  # programs.starship.enable = true;
}
