{ pkgs, ... }:
{
  imports = [
    ./vscode.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Code
    texlive.combined.scheme-full
  ];
}
