{ inputs, config, pkgs, lib, ... }:
{
  imports = [
      ./brave.nix
      ./nvim/nvchad.nix
      ./cursor.nix
      ./torrent.nix

      ./core 
      ./code 
      ./terminal
      ./hypr
      ./fun
    ];
    
  brave.enable = lib.mkDefault false;
  torrent.enable = lib.mkDefault false;

}
