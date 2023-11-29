{
  description = "Rahart/hex Nixos configuration";
  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager }:
    let 
      system = "aarch64-linux";
      user   = "hex";
      pkgs = import nixpkgs {
        inherit system;
      	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        hex = lib.nixosSystem {
          inherit system;
  	      modules = [ 
                ./hardware/aarch64-vm.nix
                ./machine/aarch64-vm.nix
                ./users/hex/nixos.nix
                home-manager.nixosModules.home-manager {
                  home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.hex = import ./users/hex/home-manager.nix;
	        }
	      ];
        };
      };
    };
}
