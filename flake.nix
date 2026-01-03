{
  description = "template for hydenix";

  inputs = {
    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Extras
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hydenix = {
      url = "github:richen604/hydenix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nvf, ...} @ inputs: let
    system = "x86_64-linux";
    hydenixConfig = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
      };
      modules = [
        nvf.nixosModules.default

        ./configuration.nix
      ];
    };
  in {
    nixosConfigurations.hydenix = hydenixConfig;
    nixosConfigurations.default = hydenixConfig;
  };
}
