{ lib, pkgs, ... }:

let
  ite8291r3-ctl = pkgs.python3Packages.buildPythonApplication {
    pname = "ite8291r3-ctl";
    version = "unstable-2024-xx-xx";

    src = pkgs.fetchFromGitHub {
      owner = "pobrn";
      repo = "ite8291r3-ctl";
      rev = "master";
      sha256 = "AuCZrsbdTExKpsIq/Ljs8upGqZeaW/Wagbzekq4sVLU=";
    };

    pyproject = true;
    build-system = with pkgs.python3Packages; [ setuptools ];

    propagatedBuildInputs = with pkgs.python3Packages; [
      pyusb
    ];

    doCheck = false;

    meta = with lib; {
      description = "Userspace controller for ITE 8291 RGB keyboards";
      platforms = platforms.linux;
    };
  };
in
{
  config = {
    environment.systemPackages = [
      ite8291r3-ctl
    ];

    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="048d", ATTRS{idProduct}=="6004", MODE="0666"
    '';
  };
}