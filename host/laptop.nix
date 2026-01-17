{ lib, ... }:
{
  environment.etc."greetd/niri-greeter-config.kdl".source = lib.mkForce ../config/niri-greeter-config.kdl;
}
