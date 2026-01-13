{pkgs, ...}: {
  environment.etc."sddm-weston.ini".text = ''
    [output]
    name=DP-5
    mode=1920x1080@60
    position=0,0

    [output]
    name=DP-4
    mode=1920x1080@60
    position=0,1080

    [output]
    name=HDMI-A-2
    mode=1920x1080@60
    position=1920,0
    transform=90
  '';

  services.displayManager.sddm.settings = {
    Wayland = {
      CompositorCommand = "${pkgs.weston}/bin/weston --shell=kiosk -c /etc/sddm-weston.ini";
    };
  };
}
