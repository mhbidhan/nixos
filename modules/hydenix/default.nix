{lib, ...}: {
  imports = [
    ./editors.nix
    ./hypridle.nix
    ./keybinds.nix
    ./monitors.nix
    ./shell.nix
    ./terminals.nix
    ./windowrules.nix
    ./xdg.nix
  ];

  hydenix = {
    hm = {
      enable = true;
      editors.neovim = false;
      hyprland.suppressWarnings = true;
      hyprland.extraConfig = ''
        exec-once = systemctl --user import-environment; systemctl --user start graphical-session.target
      '';
      swww.enable = false; # swww renamed to aww
    };
  };

  # HM: when a recursive dir entry (hydenix's hypr dir) overlaps a regular
  # file entry, the pinned home-manager keeps the recursive one and silently
  # drops ours. So defaults.conf/windowrules.conf overrides are applied at the
  # source instead: configuration.nix overlays the `hyde` package.
  # `.config/hypr/` is NOT a recursive dir, so a plain file override wins here.
  home.file = {
    ".config/hypr/windowrules.conf" = lib.mkForce {
      source = ../configs/config.windowrules.conf;
      force = true;
      mutable = true;
    };
    ".config/systemd/user/graphical-session.target.d/override.conf".text = ''
      [Unit]
      RefuseManualStart=no
      StopWhenUnneeded=no
    '';
  };
}
