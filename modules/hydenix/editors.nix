{lib, pkgs, ...}: {
  hydenix = {
    hm.editors.neovim = false;
    hm.editors.vim = true;
    hm.editors.vscode = {
      enable = true;
      wallbash = true;
    };
  };

  home.file = let
    settings = builtins.readFile "${pkgs.hyde}/Configs/.config/Code - OSS/User/settings.json";
    withFont = lib.replaceStrings [
      "'JetbrainsMono Nerd Font','Maple Mono', monospace"
    ] [
      "'JetBrains Mono','JetBrainsMono Nerd Font', monospace"
    ] settings;
  in {
    ".config/Code - OSS/User/settings.json" = lib.mkForce {
      text = withFont;
      force = true;
      mutable = true;
    };
    ".config/Code/User/settings.json" = lib.mkForce {
      text = withFont;
      force = true;
      mutable = true;
    };
    ".config/VSCodium/User/settings.json" = lib.mkForce {
      text = withFont;
      force = true;
      mutable = true;
    };
  };
}
