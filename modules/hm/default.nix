{
  pkgs,
  lib,
  ...
}: {
  imports = [];

  home = {
    file = {
      ".config/zsh/.p10k.zsh" = {
        source = lib.mkForce ../configs/p10k.zsh;
      };
      ".tmux.conf" = {
        source = ../configs/.tmux.conf;
      };
      ".catppuccin.gitconfig" = {
        source = ../configs/.catppuccin.gitconfig;
      };
    };

    activation = {
      copyGitconfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
        cat ${../configs/.gitconfig} | tee ~/.gitconfig > /dev/null
      '';
    };

    packages = with pkgs; [
      google-chrome
      obs-studio
    ];
  };

  programs.git.enable = lib.mkForce false;
}
