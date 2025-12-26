{ pkgs, lib, ... }:
{
  imports = [
    ./minecraft.nix
    ./discord.nix
  ];

  minecraft.enable = lib.mkDefault false;
  discord.enable = lib.mkDefault false;
}