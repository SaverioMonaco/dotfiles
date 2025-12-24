{ stdenv, pkgs, fetchFromGithub }:

{
nvchad = stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "6b40fb590f9750e209fb8fb78d59d2e89d0748a6";
    sha256 = "sha256-gay";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -aR $src/* $out/
  '';
  };
}
