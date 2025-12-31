{ lib, config, ... }:
{
  options = {
    brave.enable = lib.mkEnableOption "enables Brave Browser";
  };
  
  config = {
    programs.brave = {
      enable = config.brave.enable;
      extensions = [
        "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
        "ailoabdmgclmfmhdagmlohpjlbpffblp" # Surfshark
        # Youtube
        "ndpmhjnlfkgfalaieeneneenijondgag" # YouTube Anti Translate
      ];
    };
  };
}
