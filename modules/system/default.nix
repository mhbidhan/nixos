{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hosts.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.neovim-flake.packages.${system}.default
    tree
    gcc
    gnumake
    nodejs
    tree-sitter
    cargo
    rustc
    rust-analyzer
    python3
    go
    lazygit
    tmux
    zip
    unzip
    air
    fnm
    nodePackages.typescript
    nodePackages.prettier
    nodePackages.nodemon
    ripgrep
    postman
    mongodb
    mongosh
  ];
}
