{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.default = "2";
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
}