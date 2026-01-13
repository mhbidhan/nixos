{
  description = "template for hydenix";

  inputs = {
    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Extras
    neovim-flake.url = "github:mhbidhan/neovim-flake";
    hydenix = {
      url = "github:richen604/hydenix";
    };
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
