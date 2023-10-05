{ inputs, config, pkgs, ... }:

{
  # ENV 
  environment = {
    variables = {
      EDITOR = "code";
    };
    sessionVariables = {
      # Hint Electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };

    shells = with pkgs; [ zsh ];
  };

  # List services that you want to enable:
  services = {
    # OpenSSH daemon
    openssh.enable = true;

    dbus.enable = true;

    # Configure keymap in X11
    xserver = {
      layout = "it";
      xkbVariant = "";
      enable = true;
      displayManager.sddm.enable = true;
      # Enable touchpad
      libinput.enable = true;
    };

    # sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
 
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback.out ];
  boot.kernelModules = [
    "v4l2loopback"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  # Set your time zone.
  time.timeZone = "Rome/Italy";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  users.users.saverio = {
    isNormalUser = true;
    description = "Saverio";
    extraGroups = [ 
      "networkmanager" "wheel" # Do not remove wheel, 
                               # it allows the user to be
                               # in the sudoers
    ];
    packages = with pkgs; [];
  };
   
  # Window manager
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  # Helps enable screen sharing
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Enable sound with pipewire
  # sound.enable = true;
  security.rtkit.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Add additional man pages 
  documentation.dev.enable = true;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
