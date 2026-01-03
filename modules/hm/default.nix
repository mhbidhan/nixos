{pkgs, ...}: {
  imports = [./custom.nix];

  home.packages = with pkgs; [
    google-chrome
  ];

  hydenix.hm = {
    enable = true;
    editors.neovim = false;
    shell = {
      enable = true;
      zsh.enable = true;
      p10k = {
        enable = true;
      };
    };
  };
}
