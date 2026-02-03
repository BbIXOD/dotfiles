{ inputs, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings =  lib.mkForce (builtins.fromJSON (builtins.readFile ../config/noctalia/settings.json));
  };
  systemd.user.services.noctalia-shell = {
    Install = {
      WantedBy = lib.mkForce [ "niri.service" "mango-session.target" ];
    };
  };
}
