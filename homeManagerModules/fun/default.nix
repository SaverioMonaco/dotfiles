{ pkgs, lib, ... }:
{
  imports = [
    ./minecraft.nix
    ./discord.nix
    ./hearthstone.nix
  ];

  minecraft.enable = lib.mkDefault false;
  discord.enable = lib.mkDefault false;
  hearthstone.enable = lib.mkDefault false;
}