{ pkgs, lib, config, ... }:
{
  options = {
    latex.enable = lib.mkEnableOption "enables LaTeX";
  };
  
  config = lib.mkIf config.latex.enable {
    home.packages = with pkgs; [
      texlive.combined.scheme-full
    ];
  };
}