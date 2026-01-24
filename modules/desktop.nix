{
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.sysc-greet.nixosModules.default
    inputs.mango.nixosModules.mango
  ];
  programs.niri.enable = true;
  programs.mango.enable = true;

  services.sysc-greet = {
    enable = true;
    compositor = "niri";
    # settings.initial_session = {
    #   command = "niri-session";
    #   user = "maksym";
    # };
  };
}
