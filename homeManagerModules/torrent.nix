{ lib, config, pkgs, ... }:
{
  options = {
    torrent.enable = lib.mkEnableOption "enables Transmission Torrent Client";
  };
  
  config = lib.mkIf config.torrent.enable {
    home.packages = with pkgs; [
        transmission_4-gtk
    ];
  };
}