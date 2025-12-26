{ lib, config, ... }:
{
  options = {
    brave.enable = lib.mkEnableOption "enables Brave Browser";
  };
  
  config = {
    programs.brave = {
      enable = config.brave.enable;
      extensions = [
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      ];
    };
  };
}
