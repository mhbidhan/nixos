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
}
