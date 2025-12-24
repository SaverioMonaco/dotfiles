{ inputs, config, pkgs, ... }:

{
  imports = [
      inputs.nix4nvchad.homeManagerModule
    ];

  home.username = "samonaco";
  home.homeDirectory = "/home/samonaco";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    foot
    tmux
    neofetch
    nnn # terminal file manager
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
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings.user = {
      name = "Saverio Monaco";
      email = "saveriomonaco97@gmail.com";
    };
  };

  programs.zsh = {
    enable = true;
    # autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa"
      bindkey '\t\t' autosuggest-accept # double tab : accept suggestion
      eval "$(zoxide init zsh)"
    '';

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      ];
    };
  };

  programs.oh-my-posh = {
    enable = true;
    configFile = ./EVAzshtheme.toml;
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    prefix = "C-b";

    extraConfig = ''
      # --- Vim-style pane navigation ---
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # --- Splits ---
      # Vertical split (side-by-side)
      bind v split-window -h

      # Horizontal split (top/bottom)
      bind s split-window -v

      # Unbind default split keys
      unbind %
      unbind '"'
    '';
  };

  programs.bash = {
    enable = true;
    bashrcExtra = "tmux";
  };

  programs.nvchad.enable = true;

  programs.brave = {
    enable = true;
    extensions = [
      "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
    ];
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        bbenoist.nix
        asvetliakov.vscode-neovim 
      ]);

      userSettings = {
        "extensions.experimental.affinity" = {
                "asvetliakov.vscode-neovim" = 1;
        };
      };
    };
  };

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
