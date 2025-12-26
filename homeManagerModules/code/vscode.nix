{ pkgs, ... } :
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        bbenoist.nix
        asvetliakov.vscode-neovim 
        shd101wyy.markdown-preview-enhanced
        james-yu.latex-workshop
      ]);

      userSettings = {
        "extensions.experimental.affinity" = {
                "asvetliakov.vscode-neovim" = 1;
        };
      };
    };
  };
}