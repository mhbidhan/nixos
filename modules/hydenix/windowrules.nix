{lib, ...}: {
  hydenix.hm.hyprland.windowrules = {
    enable = true;
  };

  home.file = {
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
