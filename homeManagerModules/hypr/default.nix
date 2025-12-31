{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    # ./exec-once.nix
    # ./monitors.nix
    ./settings.nix
    ./binds.nix
    # ./windowrules.nix
    # ./hyprlock.nix
    # ./variables.nix
    ./ags.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
  ];

}
