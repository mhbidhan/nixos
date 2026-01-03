{lib, ...}: {
  home = {
    file = {
      ".config/zsh/.p10k.zsh" = {
        source = lib.mkForce ../../config/zsh/p10k.zsh;
      };
      ".config/kitty/kitty.conf" = {
        source = ../../config/kitty/kitty.conf;
      };
      ".config/hypr/monitors.conf" = {
        source = lib.mkForce ../../config/hypr/monitors.conf;
      };
      ".tmux.conf" = {
        source = ../../config/tmux/.tmux.conf;
      };
    };
  };

  programs.git.enable = lib.mkForce false;
  programs.zsh = {
    initContent = ''
      # Path
      export PATH="$HOME/.local/share/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$HOME/my-scripts:$PATH"
      export EDITOR=nvim
      export VISUAL=nvim

      # KEY_BINDS
      bindkey '^@' autosuggest-accept

      eval "$(fnm env --use-on-cd --shell zsh)"

      source ~/.config/zsh/.p10k.zsh
    '';
  };
}
