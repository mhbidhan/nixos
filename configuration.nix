{
  inputs,
  lib,
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

    # Hardware Modules
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    # Custom
    ./modules/pde
  ];

  hardware = {
    cpu.intel.updateMicrocode = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  services = {
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      };
    };

    libinput.enable = true;
  };

  # Brightness control
  programs.light.enable = true;

  # systemd.services.fix-hibernate-wakeup = {
  #   description = "Disable all ACPI wake triggers except Keyboard/Mouse and Power Button";
  #   after = ["multi-user.target"];
  #   wantedBy = ["multi-user.target"];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.gawk}/bin/awk \"/enabled/ && !/XHC0|XHC1|PWRB|PBTN/ {print \\$1}\" /proc/acpi/wakeup | while read -r device; do echo \"$device\" > /proc/acpi/wakeup; done'";
  #     RemainAfterExit = "yes";
  #   };
  # };

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

  # Hyprland Version Lock
  programs.hyprland = {
    enable = true;
    package = lib.mkForce inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = lib.mkForce inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
