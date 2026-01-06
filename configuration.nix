{
  config,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.overlays.default
    ];
  };
in {
  nixpkgs.pkgs = pkgs;

  imports = [
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    inputs.hydenix.nixosModules.default
    ./modules/system
    ./hardware-configuration.nix
    # GPU Configuration (choose one):
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia # NVIDIA
    inputs.nixos-hardware.nixosModules.common-hidpi # High-DPI displays
    # inputs.nixos-hardware.nixosModules.common-gpu-amd # AMD
    # CPU Configuration (choose one):
    inputs.nixos-hardware.nixosModules.common-cpu-amd # AMD CPUs
    # inputs.nixos-hardware.nixosModules.common-cpu-intel # Intel CPUs
    # inputs.nixos-hardware.nixosModules.common-pc-laptop # Laptops
    # inputs.nixos-hardware.nixosModules.common-pc-ssd # SSD storage

    # Custom
    ./config/config.nix
  ];

  hardware = {
    cpu.amd.updateMicrocode = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        offload.enable = false;
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users."bidhan" = {...}: {
      imports = [
        inputs.hydenix.homeModules.default
        ./modules/hm
        ./modules/hydenix
      ];
    };
    backupFileExtension = "backup";
  };

  users.users.bidhan = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    shell = pkgs.zsh;
  };

  hydenix = {
    enable = true;
    hostname = "nixos";
    timezone = "Asia/Dhaka";
    locale = "en_US.UTF-8";
    audio.enable = true;
    gaming.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
}
