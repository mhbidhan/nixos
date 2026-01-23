{
  description = "template for hydenix";

  inputs = {
    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    # Extras
    neovim-flake.url = "github:mhbidhan/neovim-flake";
    hyprland.url = "github:hyprwm/Hyprland/386376400119dd46a767c9f8c8791fd22c7b6e61";
    hydenix = {
      url = "github:richen604/hydenix";
      inputs.hyprland.follows = "hyprland";
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
