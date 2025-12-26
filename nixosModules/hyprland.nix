{ lib, config, inputs, pkgs, ... }:
{
  options = {
    hyprland.enable = lib.mkEnableOption "enables Hyprland";
  };

  config = {
    # Enable Hyprland
    programs.hyprland = {
      enable = config.hyprland.enable;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}