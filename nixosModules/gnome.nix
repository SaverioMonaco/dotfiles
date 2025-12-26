{ pkgs, lib, config, ... }:
{
  options = {
    gnome.enable = lib.mkEnableOption "enables gnome env";
  };

  config = lib.mkIf config.gnome.enable {
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Exclude some default apps
    environment.gnome.excludePackages = with pkgs; [
      baobab      # disk usage analyzer
      cheese      # photo booth
      eog         # image viewer
      epiphany    # web browser
      gedit       # text editor
      simple-scan # document scanner
      totem       # video player
      yelp        # help viewer
      geary       # email client
      seahorse    # password manager

      # these should be self explanatory
      gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts
      gnome-font-viewer gnome-logs gnome-maps gnome-music gnome-photos gnome-screenshot
      gnome-weather gnome-disk-utility pkgs.gnome-connections
      gnome-console gnome-system-monitor 
    ];
  };
}