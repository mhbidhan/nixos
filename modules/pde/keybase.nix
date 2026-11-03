{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    keybase
  ];

  # Required for PGP key generation, imports, and passphrase prompts
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses; # Or pinentry-gnome3 / pinentry-qt depending on your desktop environment
  };

  services.keybase = {
    enable = true;
  };

  # Optional: Enable Keybase Filesystem mount
  services.kbfs = {
    enable = true;
  };
}
