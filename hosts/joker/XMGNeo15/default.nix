{ lib, pkgs, ... }:
{
    imports = [
      ./boot.nix
      ./monitor.nix
      ./touchpad.nix
      ./keybacklight.nix
    ];
}