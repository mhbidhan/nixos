{
  pkgs,
  lib,
  ...
}: {
  imports = [];

  home = {
    file = {
      ".config/zsh/.p10k.zsh" = {
        source = lib.mkForce ../../config/zsh/p10k.zsh;
      };
      ".tmux.conf" = {
        source = ../../config/tmux/.tmux.conf;
      };
    };

    packages = with pkgs; [
      google-chrome
    ];
  };

  programs.git.enable = lib.mkForce false;
}
