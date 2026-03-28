{pkgs, ...}: {
  hardware.steam-hardware.enable = true;

  services.udev.packages = with pkgs; [
    game-devices-udev-rules
  ];

  boot.kernelModules = ["xpad"];

  # services.udev.extraRules = ''
  #   ACTION=="add", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="301c", MODE="0666", RUN+="${pkgs.kmod}/bin/modprobe xpad", RUN+="${pkgs.bash}/bin/sh -c 'echo 2dc8 301c > /sys/bus/usb/drivers/xpad/new_id'"
  # '';
}
