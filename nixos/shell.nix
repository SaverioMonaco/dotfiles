{
  #shellAliases
  programs.bash.shellAliases = {
    #################
    # NIXOS RELATED #
    #################
    switch      = "sudo nixos-rebuild switch --flake .#joker";
    switchu     = "sudo nixos-rebuild switch --upgrade --flake .#joker";
    switchd     = "sudo nixos-rebuild switch --flake .#joker --show-trace";
    nixclean    = "sudo nix-collect-garbage -d";
    nixcleanold = "sudo nix-collect-garbage --delete-old";
  };
}