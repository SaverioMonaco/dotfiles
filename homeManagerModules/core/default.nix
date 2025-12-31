{ pkgs, inputs, config, ... }:
{
  imports = [
    ./git.nix
    inputs.agenix.homeManagerModules.default
    # Secrets
    ../../secrets/secrets.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Terminal stuff
    neofetch
    fzf
    zoxide
    zip
    unzip
    cowsay
    which
    bat # better cat
    btop  # replacement of htop/nmon
    tree
    nh # nix cleaning
    
    # Files
    kdePackages.dolphin # This is the actual dolphin package
    file-roller # archive-manager
    
    # Media
    vlc
    qimgv # image viewer
    evince # pdf
    
    # Youtube
    yt-dlp
    yewtube
  ];
}
