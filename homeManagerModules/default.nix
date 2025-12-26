{ inputs, config, pkgs, lib, ... }:
{
  imports = [
      ./brave.nix
      ./nvim/nvchad.nix
      ./cursor.nix

      ./core 
      ./code 
      ./fun
      ./terminal
      ./hypr
    ];
    
  brave.enable = lib.mkDefault true;
}
