{lib, ...}: {
  imports = [
    ./editors.nix
    ./hypridle.nix
    ./keybinds.nix
    ./monitors.nix
    ./shell.nix
    ./terminals.nix
    ./windowrules.nix
  ];

  hydenix = {
    hm = {
      enable = true;
      editors.neovim = false;
      hyprland.suppressWarnings = true;
      swww.enable = false; # swww renamed to aww
    };
  };

  home.file = {
    ".local/share/hypr/defaults.conf" = lib.mkForce {
      source = ../configs/local.share.defaults.conf;
      force = true;
      mutable = true;
    };
    ".local/share/hypr/windowrules.conf" = lib.mkForce {
      source = ../configs/local.windowrules.conf;
      force = true;
      mutable = true;
    };
    ".config/hypr/windowrules.conf" = lib.mkForce {
      source = ../configs/config.windowrules.conf;
      force = true;
      mutable = true;
    };
  };
}
