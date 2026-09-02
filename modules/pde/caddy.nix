{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    caddy
  ];

  services.caddy = {
    enable = true;
  };

  systemd.services.caddy.serviceConfig = {
    ExecStart = [
      ""
      "${pkgs.caddy}/bin/caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"
    ];
    ExecReload = [
      ""
      "${pkgs.caddy}/bin/caddy reload --config /etc/caddy/Caddyfile --adapter caddyfile"
    ];
  };
}
