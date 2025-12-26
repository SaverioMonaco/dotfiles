{ inputs, ... }:
{
  imports = [
    inputs.xremap-flake.nixosModules.default
  ];

  services.xremap = {
    enable = true;
    config = {
      keymap = [
        {
          name = "Swap Esc and Caps";
          remap = {
            CapsLock = "Esc";
            Esc = "CapsLock";
          };
        }
      ];
    };
  };
}