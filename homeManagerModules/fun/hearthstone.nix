{ lib, config, pkgs, ... }:

let
  hearthstoneSrc = pkgs.fetchFromGitHub {
    owner = "SaverioMonaco";
    repo = "hearthstone-linux";
    rev = "master";
    sha256 = "IK7HS8MPk9YXoMWMrO6a3Y/dMlhxgShtvxiA/tYucmc=";
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
        if [[ ! -f "$TOKEN_FILE" && -f "$HOME/.config/age/keys.txt" ]]; then
          export PATH=${lib.makeBinPath [
            pkgs.age
          ]}:$PATH
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

          # Decrypt token via agenix
          DOTFILES_DIR="${config.home.homeDirectory}/.dotfiles"
          TOKEN_SRC="$DOTFILES_DIR/secrets/token-hearthstone.age"
          TOKEN_DST="${hearthstoneDir}/login/token-hearthstone.txt"
          # Only decrypt/copy if destination doesn't exist
          if [ ! -f "$TOKEN_DST" ]; then
            age --decrypt -i "$HOME/.config/age/keys.txt" $TOKEN_SRC > "$TOKEN_DST"
            chmod 600 "$TOKEN_DST"
          fi
        fi
      '';
  };
}