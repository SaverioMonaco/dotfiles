{ lib, config, ... }:
{
  options = {
    discord.enable = lib.mkEnableOption "enables Discord";
  };
  
  config = {
    programs.discord = {
      enable = config.discord.enable;
    };
  };
}