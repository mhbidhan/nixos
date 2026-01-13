_: {
  hydenix.hm.shell = {
    enable = true;
    zsh.enable = true;
    p10k = {
      enable = true;
    };
  };

  programs.zsh = {
    initContent = ''
      # Path
      export PATH="$HOME/.local/share/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$HOME/my-scripts:$PATH"
      export EDITOR=nvim
      export VISUAL=nvim
      export GOPATH=$HOME/go
      export ATAC_KEY_BINDINGS=$HOME/.config/atac/key_bindings.toml
      export PATH="$PATH:$(go env GOPATH)/bin"

      # KEY_BINDS
      bindkey '^@' autosuggest-accept

      eval "$(fnm env --use-on-cd --shell zsh)"

      source ~/.config/zsh/.p10k.zsh
    '';
  };
}
