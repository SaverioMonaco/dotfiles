{ inputs, pkgs, lib, ... }:
{
    imports = [
        ./fonts.nix
        ./gnome.nix
        ./hyprland.nix

        ./io
    ];

    gnome.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault false;
}
