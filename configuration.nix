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
      (_: super: {
        swww = super.awww;
        # hydenix fetches this from HyDE master where it was deleted (404);
        # use the nixpkgs-maintained package which ships the same
        # share/icons/Bibata-Modern-Ice theme.
        Bibata-Modern-Ice = super.bibata-cursors;
        # Hyprland 0.55+ removed the dwindle.pseudotile option; the upstream
        # HyDE defaults.conf still sets it and errors. Replace it with our
        # local copy (no dwindle block). This also sidesteps the pinned
        # home-manager, where a recursive directory entry always beats a
        # per-file override.
        hyde = super.hyde.overrideAttrs (old: {
          buildPhase = old.buildPhase + ''
            cp ${./modules/configs/local.share.defaults.conf} Configs/.local/share/hypr/defaults.conf
            cp ${./modules/configs/local.windowrules.conf} Configs/.local/share/hypr/windowrules.conf
          '';
        });
      })
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
    ./modules/pde
    ./modules/gaming
  ];

  boot.kernelParams = [
    "video=DP-5:1920x1080@60,0+0"
    "video=DP-4:1920x1080@60,0+1080"
    "video=HDMI-A-2:1920x1080@60,1920+0,reflect_x"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  hardware = {
    cpu.amd.updateMicrocode = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
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

  systemd.services.fix-hibernate-wakeup = {
    description = "Disable all ACPI wake triggers except Keyboard/Mouse and Power Button";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c ' \
      ${pkgs.gawk}/bin/awk \"/enabled/ && !/XHC0|XHC1|PWRB|PBTN/ {print \\$1}\" /proc/acpi/wakeup | while read -r device; do \
        echo \"Disabling $device...\"; \
        echo \"$device\" > /proc/acpi/wakeup; \
      done \
    '";
      RemainAfterExit = "yes";
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
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = with pkgs; [
          awww # renamed from swww
        ];
      };
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
      "podman"
      "libvirtd"
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
