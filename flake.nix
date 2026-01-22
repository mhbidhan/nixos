{
  description = "template for hydenix";

  inputs = {
    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Extras
    neovim-flake.url = "github:mhbidhan/neovim-flake";
    hydenix.url = "github:richen604/hydenix/f47e7d57e6c8f0e7ce60735e975392c762376a4a";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    hydenixConfig = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};

      modules = [
        # ONLY your NixOS configuration files go here
        ./configuration.nix
      ];
    };
  in {
    nixosConfigurations.hydenix = hydenixConfig;
    nixosConfigurations.default = hydenixConfig;
  };
}
