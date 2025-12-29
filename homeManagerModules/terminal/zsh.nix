{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa"
      bindkey '\t\t' autosuggest-accept # double tab : accept suggestion
      # Case-insensitive tab completion
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      eval "$(zoxide init zsh)"
      
      # For Joker keyboard backlight control
      itekb() {
        if [ -z "$1" ]; then
          echo "Usage: kb <brightness> [color]"
          return 1
        fi
        if [ -z "$2" ]; then
              local COLOR="white"
            else
              local COLOR="$2"
            fi

        ite8291r3-ctl monocolor -b "$1" --name "$COLOR"
      }
    '';

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
  };
}
