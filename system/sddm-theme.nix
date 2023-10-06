{ pkgs }:
let
  imgLink = "https://raw.githubusercontent.com/SaverioMonaco/dotfiles/main/assets/greeter.png";

  image = pkgs.fetchurl {
    url = imgLink;
    # sha256 = "sha256-d+TJnfgi3y78QrNReObtzmKOKtjFR2ATI1S7r32jRUQ=";
  };

  repo = pkgs.fetchFromGitHub {
    owner = "ArtemSmaznov";
    repo = "SDDM-themes";
    rev = "eff498d2b09692c91e318026adbfa1ea440f6d5d";
    sha256 = "sha256-GVJRSQrnh7fEtDJ1wwhi/A70WaKLuce9/G+4XvvDc70=";
  };

  theme = import ./sddm-theme-conf.nix;
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = "${repo}/sugar-candy";
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Backgrounds/distance-sunset.jpg
    rm theme.conf
    cp -r ${image} $out/Backgrounds/distance-sunset.jpg
    echo -e "${theme.conf}" >> $out/theme.conf
   '';
}

