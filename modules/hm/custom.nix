{  lib, ... }:

{
  home.file = {
    ".config/nvim" = {
      source = ../../config/nvim;
      recursive = true;
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

  programs.git.enable = lib.mkForce false;
  programs.zsh = {
    initExtra = '' 
# Path
export PATH="$HOME/.local/share/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/my-scripts:$PATH"

# KEY_BINDS
bindkey '^@' autosuggest-accept

eval "$(fnm env --use-on-cd --shell zsh)"
'';
  };
}
