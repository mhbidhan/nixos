{lib, pkgs, ...}: {
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
  home.packages = [
    pkgs.jetbrains-mono
  ];

  home.file = {
    ".config/gtk-3.0/settings.ini" = lib.mkForce {
      text = lib.replaceStrings [
        "gtk-font-name=Cantarell 10"
      ] [
        "gtk-font-name=JetBrains Mono 10"
      ] (builtins.readFile "${pkgs.hyde}/Configs/.config/gtk-3.0/settings.ini");
      force = true;
      mutable = true;
    };
    ".gtkrc-2.0" = lib.mkForce {
      text = lib.replaceStrings [
        "gtk-font-name=\"Cantarell 10\""
      ] [
        "gtk-font-name=\"JetBrains Mono 10\""
      ] (builtins.readFile "${pkgs.hyde}/Configs/.gtkrc-2.0");
      force = true;
      mutable = true;
    };
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

  fonts.fontconfig.defaultFonts = {
    sansSerif = ["JetBrains Mono"];
    serif = ["JetBrains Mono"];
    monospace = ["JetBrains Mono"];
  };
}
