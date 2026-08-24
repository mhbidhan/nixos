{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      nss
      nspr
      atk
      cups
      dbus
      libdrm
      gtk3
      pango
      cairo
      expat
      alsa-lib
      mesa
      libxkbcommon
      at-spi2-core

      mesa
      libgbm
      libxcb
      libx11
      libxcomposite
      libxcursor
      libxdamage
      libxext
      libxfixes
      libxi
      libxrandr
      libxrender
      libxscrnsaver
      libxtst
    ];
  };
}
