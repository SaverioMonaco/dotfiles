{...}: 
{
    programs.yazi = {
        enable = true;
        enableZshIntegration = true;
    };

    xdg.configFile."yazi/yazi.toml".source = ../../../../config/yazi.toml;
}