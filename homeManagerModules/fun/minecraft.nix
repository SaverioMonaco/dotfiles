{ lib, config, pkgs, ... }:
{
  options = {
    minecraft.enable = lib.mkEnableOption "enables Minecraft";
  };
  
  config = lib.mkIf config.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}