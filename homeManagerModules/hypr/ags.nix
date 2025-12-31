{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # symlink to ~/.config/ags
    configDir = ../../config/ags;

    # additional packages and executables to add to gjs's runtime
    extraPackages = with pkgs; [
      inputs.astal.packages.${pkgs.system}.battery
      inputs.astal.packages.${pkgs.system}.powerprofiles
      inputs.astal.packages.${pkgs.system}.wireplumber
      inputs.astal.packages.${pkgs.system}.network
      inputs.astal.packages.${pkgs.system}.tray
      inputs.astal.packages.${pkgs.system}.mpris
      inputs.astal.packages.${pkgs.system}.apps
    ];
  };
}
