{ inputs, config, pkgs, ... }:
{
  imports = [
      ./../../homeManagerModules
    ];
    
  # minecraft.enable = true;
  # discord.enable = true;
  brave.enable = true;
  vscode.enable = true;
  latex.enable = true;
  slack.enable = true;
  mattermost.enable = true;
  thunderbird.enable = true;

  home.username = "samonaco";
  home.homeDirectory = "/home/samonaco";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
