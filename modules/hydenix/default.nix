_: {
  imports = [
    ./editors.nix
    ./keybinds.nix
    ./monitors.nix
    ./shell.nix
    ./terminals.nix
  ];

  hydenix = {
    hm = {
      enable = true;
      editors.neovim = false;
    };
  };
}
