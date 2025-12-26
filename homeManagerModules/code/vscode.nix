{ pkgs, lib, config, ... } :
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        bbenoist.nix # Nix language support
        asvetliakov.vscode-neovim # Neovim integration
        shd101wyy.markdown-preview-enhanced # Markdown Preview
        james-yu.latex-workshop # LaTeX support
        github.copilot
        ms-python.python # Python support
        ms-toolsai.jupyter # Jupyter Notebooks
        tamasfe.even-better-toml # TOML support
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "nvim-ui-modifier";
          publisher = "JulianIaquinandi";
          version = "0.1.5";
          sha256 = "Z9h/K73FBEIOwr4fcpDtQ03+Usc8+XA37eq9VlVyADg=";
        }
      ]);


    };
  };

  # Link the VSCode/VSCodium settings.json to your repo
  home.file.".config/VSCodium/User/settings.json".source = lib.mkForce (
    config.lib.file.mkOutOfStoreSymlink "/home/samonaco/.dotfiles/config/vscode-settings.json"
  );
}