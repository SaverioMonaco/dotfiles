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

    nix.settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
}
