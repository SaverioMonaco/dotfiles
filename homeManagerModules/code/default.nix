{ pkgs, lib, config, ... }:
{
  imports = [
    ./vscode.nix
    ./latex.nix
  ];

  vscode.enable = lib.mkDefault false;
  latex.enable = lib.mkDefault false;
}
