{ pkgs, lib, config, ... }:
{
  options = {
    thunderbird.enable = lib.mkEnableOption "enables mail client Thunderbird";
  };
  
  config = lib.mkIf config.thunderbird.enable {
    home.packages = with pkgs; [
      thunderbird
    ];
  };
}