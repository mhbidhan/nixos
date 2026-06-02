{pkgs, ...}: {
  services = {
    mongodb.enable = true;
    redis.servers."".enable = true;
    postgresql = {
      enable = true;
      package = pkgs.postgresql_16;

      authentication = pkgs.lib.mkOverride 10 ''
        # type database  user  address     auth-method
        local  all       all               trust
        host   all       all   127.0.0.1/32  trust
        host   all       all   ::1/128       trust
      '';
    };
  };
  virtualisation.docker.enable = true;
}
