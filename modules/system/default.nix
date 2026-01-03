{pkgs, ...}: {
  imports = [
    ./hosts.nix
  ];

  environment.systemPackages = with pkgs; [
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
    fnm
    nodePackages.typescript
    nodePackages.prettier
    nodePackages.nodemon
    ripgrep
  ];
}
