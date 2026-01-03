{
  config,
  lib,
  ...
}: {
  environment.etc."hosts" = {
    text = lib.mkForce ''
      127.0.0.1 localhost
      ::1       localhost
      127.0.0.2 ${config.networking.hostName}
    '';
    mode = "0644";
  };

  networking.nameservers = ["1.1.1.1" "9.9.9.9" "8.8.8.8"];
}
