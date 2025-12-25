{ inputs, config, pkgs, ... }:
{
  imports = [
      inputs.nix4nvchad.homeManagerModule

      ./modules/brave.nix
      ./modules/git.nix
      ./modules/nvim/nvchad.nix
      ./modules/vscode.nix
      ./modules/cursor.nix

      ./modules/terminal/tmux.nix
      ./modules/terminal/zsh.nix
      ./modules/terminal/bash.nix
      ./modules/terminal/oh-my-posh.nix
      ./modules/terminal/foot.nix
      ./modules/terminal/yazi.nix

      ./modules/hypr
    ];

  home.username = "samonaco";
  home.homeDirectory = "/home/samonaco";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    fzf
    zoxide

    # archives
    zip
    unzip

    # misc
    cowsay
    which
    bat

    # productivity
    btop  # replacement of htop/nmon
    
    kdePackages.dolphin # This is the actual dolphin package
    file-roller # archive-manager
    
    # media
    vlc
    qimgv # image viewer
    evince # pdf
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
