{ lib, python3Packages }:
with python3Packages;
buildPythonApplication {
  pname = "avell-unofficial-control-center";
  version = "1.0.4";

  src = ./.;
}
