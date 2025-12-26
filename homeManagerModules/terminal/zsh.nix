{
  programs.zsh = {
    enable = true;
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
}