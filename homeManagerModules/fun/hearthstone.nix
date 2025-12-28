# To install
# Run (inside folder):
# nix-shell --extra-experimental-features flakes -p gcc gnumake pkg-config gtk3 cryptopp webkitgtk_4_1 python3 python3Packages.virtualenv git curl binutils --run "bash ./craft.sh"

{ lib, config, pkgs, ... }:

let
  hearthstoneSrc = pkgs.fetchFromGitHub {
    owner = "0xf4b1";
    repo = "hearthstone-linux";
    rev = "master";
    sha256 = "kisoamsMSQ2UPXASU64FHZacpz27yole0ebU52yMAPw=";
  };

  kegSrc = pkgs.fetchFromGitHub {
    owner = "0xf4b1";
    repo = "keg";
    rev = "master";
    sha256 = "CtssW/yf9CeM2eQWwa/V8KAOC29ObDghiUFMoglB0BA=";
  };

  hearthstoneDir = "${config.home.homeDirectory}/.local/share/hearthstone-linux";

in {
  options.hearthstone.enable =
    lib.mkEnableOption "Enable Hearthstone";

  config = lib.mkIf config.hearthstone.enable {

    home.packages = [
      pkgs.steam-run
    ];

    home.activation.installHearthstone =
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Make sure required tools are on PATH
        TOKEN_FILE="${hearthstoneDir}/hearthstone/token"
        if [[ ! -f "$TOKEN_FILE" ]]; then
          # Install Hearthstone
          if [ ! -d "${hearthstoneDir}" ]; then
            echo "Installing hearthstone-linux into home directory"
            mkdir -p "${hearthstoneDir}"
            cp -r ${hearthstoneSrc}/* "${hearthstoneDir}"
          fi
          chmod -R u+rwX "${hearthstoneDir}"

          # Install Keg
          if [ ! -d "${hearthstoneDir}/keg" ] || [ -z "$(ls -A "${hearthstoneDir}/keg")" ]; then
            mkdir -p "${hearthstoneDir}/keg"
            cp -r ${kegSrc}/* "${hearthstoneDir}/keg"
          fi
          chmod -R u+rwX "${hearthstoneDir}"
        fi

        cat <<EOF >$HOME/.local/share/applications/hearthstone.desktop
        [Desktop Entry]
        Type=Application
        Name=Hearthstone
        Path=${hearthstoneDir}/hearthstone/
        Exec=steam-run Bin/Hearthstone.x86_64
        Icon=${hearthstoneDir}/hearthstone/Bin/Hearthstone_Data/Resources/PlayerIcon.icns
        Categories=Game;
        StartupWMClass=Hearthstone.x86_64
        EOF
      '';
  };
}