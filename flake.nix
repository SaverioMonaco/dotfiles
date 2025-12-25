{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    
    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Remap keys, to swap CAPS and Esc
    xremap-flake.url = "github:xremap/nix-flake";

    # adding the starter input here
    mynvchad = {
      url = "github:SaverioMonaco/nvchad"; # <- for local relative folder (e.g. path:./home/nvim) 
      flake = false;
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "mynvchad"; # <- overwrite the module input here
    };

    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        joker = lib.nixosSystem {
          system = "x86_64-linux";
	        specialArgs = { inherit inputs; };
          modules = [
            ./hosts/joker/configuration.nix 
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.samonaco = import ./hosts/joker/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs; };
              # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix 
            }         
        ];
      };
    };
  };
}
