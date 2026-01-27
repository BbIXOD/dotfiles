{ lib, ... }:
{
  environment.etc."greetd/niri-greeter-config.kdl".source =
    lib.mkForce ../config/niri-greeter-config.kdl;
  nix.settings = {
    cores = 5;
    max-jobs = 2;
  };
  systemd.services.nix-daemon.serviceConfig = {
    MemoryHigh = "5G";
    MemoryMax = "6G";
  };

}
