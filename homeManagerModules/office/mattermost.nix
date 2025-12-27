{ pkgs, lib, config, ... }:
{
  options = {
    mattermost.enable = lib.mkEnableOption "enables Mattermost";
  };
  
  config = lib.mkIf config.mattermost.enable {
    home.packages = with pkgs; [
      mattermost
    ];
  };
}