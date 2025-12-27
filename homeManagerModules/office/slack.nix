{ pkgs, lib, config, ... }:
{
  options = {
    slack.enable = lib.mkEnableOption "enables Slack";
  };
  
  config = lib.mkIf config.slack.enable {
    home.packages = with pkgs; [
      slack
    ];
  };
}