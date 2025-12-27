# All work and no play makes Jack a dull boy
{ pkgs, lib, config, ... }:
{
  imports = [
     ./slack.nix
     ./mattermost.nix
     ./thunderbird.nix
  ];

  slack.enable = lib.mkDefault false;
  mattermost.enable = lib.mkDefault false;
  thunderbird.enable = lib.mkDefault false;
}