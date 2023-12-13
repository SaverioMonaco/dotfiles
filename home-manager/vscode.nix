{ config, lib, pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        extensions = with pkgs.vscode-extensions; [
            # Search for the `identifier` in the extention page
            bbenoist.nix
        ];
        userSettings = {
            # What goes here ???
        };
    };
}
