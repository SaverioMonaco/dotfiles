{ inputs, config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Apps
    kitty
    obsidian
    pavucontrol
   
    # GUI
    dunst
    libnotify
    hyprland
    rofi-wayland
    swww
    waybar
    wayland-protocols
    wayland-utils
    wlroots
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    xwayland
    libsForQt5.qt5.qtgraphicaleffects # for the sddm theme
    swaylock-effects
    
    # Screen shot & share
    ffmpeg_6-full
    gphoto2
    grim
    mpv
    slurp

    # Utils
    bat
    killall
    ncdu
    neofetch

    # Programming 
    python311Full

    # misc system
    pipewire
    wl-clipboard

    # Build tools
    cmake
    gcc
  ];
  
  # Fonts
  fonts.packages = with pkgs; [
    # Nerd fonts
    nerdfonts
    meslo-lgs-nf
  ];
}
