{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.sysc-greet.nixosModules.default
    inputs.mango.nixosModules.mango
  ];
  programs.niri.enable = true;
  programs.mango.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = lib.mkForce [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.sysc-greet = {
    enable = true;
    compositor = "niri";
    # settings.initial_session = {
    #   command = "niri-session";
    #   user = "maksym";
    # };
  };
}
