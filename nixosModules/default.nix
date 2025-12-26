{ inputs, pkgs, lib, ... }:
{
    imports = [
        inputs.agenix.nixosModules.default

        ./fonts.nix
        ./gnome.nix
        ./hyprland.nix

        ./io
    ];

    gnome.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault false;
}
