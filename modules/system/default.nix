{ pkgs, ... }:

{
  imports = [
    ./hosts.nix
  ];

  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cargo
    rustc
    rust-analyzer 
    python3
    nodejs
    go
    tree-sitter
    lazygit
    tmux
    zip
    unzip
    fnm
    nodePackages.typescript
    nodePackages.prettier
    nodePackages.nodemon
  ];
}
