{ pkgs, ... }:

{
  imports = [ ./custom.nix ];

  home.packages = with pkgs; [
    google-chrome
  ];

  hydenix.hm.enable = true;
}
