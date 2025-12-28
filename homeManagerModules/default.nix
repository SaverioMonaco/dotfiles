{ inputs, config, pkgs, lib, ... }:
{
  imports = [
      ./brave.nix
      ./nvim/nvchad.nix
      ./cursor.nix

      ./core 
      ./code 
      ./terminal
      ./hypr
      ./fun
    ];
    
  brave.enable = lib.mkDefault false;

}
