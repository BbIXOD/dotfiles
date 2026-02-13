{
  inputs,
  pkgs,
  system,
  ...
}:
let
  mangoPkg = import ../lib/mango.nix { inherit inputs system; };
in
{
  imports = [
    inputs.sysc-greet.nixosModules.default
    inputs.mango.nixosModules.mango
  ];
  programs.sway.enable = true;
  programs.mango = {
    enable = true;
    package = mangoPkg.mango;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  services.sysc-greet = {
    enable = true;
    compositor = "sway";
    # settings.initial_session = {
    #   command = "niri-session";
    #   user = "maksym";
    # };
  };

}
