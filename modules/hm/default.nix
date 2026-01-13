{
  pkgs,
  lib,
  ...
}: {
  imports = [];

  home = {
    file = {
      ".config/zsh/.p10k.zsh" = {
        source = lib.mkForce ../zsh/p10k.zsh;
      };
      ".tmux.conf" = {
        source = ../tmux/.tmux.conf;
      };
    };

    packages = with pkgs; [
      google-chrome
      obs-studio
    ];
  };

  programs.git.enable = lib.mkForce false;
}
