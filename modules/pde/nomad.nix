{...}: {
  services.nomad = {
    enable = true;
    dropPrivileges = false;
    enableDocker = true;

    settings = {
      datacenter = "dc1";
      data_dir = "/var/lib/nomad";
      bind_addr = "127.0.0.1";

      advertise = {
        http = "127.0.0.1:4646";
        rpc = "127.0.0.1:4647";
        serf = "127.0.0.1:4648";
      };

      plugin."docker".config = {
  endpoint = "unix:///var/run/docker.sock";
  volumes = {
    enabled = true;
  };
};

      server = {
        enabled = true;
        bootstrap_expect = 1;
      };

      client = {
        enabled = true;
        host_volume = {
          nomad_volume = {
            path = "/home/bidhan/nomad_volume";
            read_only = false;
          };
        };
        host_network = {
          lo = {
            interface = "lo";
            cidr = "127.0.0.1/32";
          };
        };
      };
    };
  };
}
