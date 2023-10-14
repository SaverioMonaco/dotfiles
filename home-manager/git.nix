let
  email = "saveriomonaco97@gmail.com";
  name = "Saverio Monaco";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      github.user = name;
      push.autoSetupRemote = true;
    };
    userEmail = email;
    userName = name;
  };
}