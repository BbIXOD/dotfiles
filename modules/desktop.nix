{
  inputs,
  pkgs,
  ...
}:
let
  mangoPkg = import ../lib/mango.nix { inherit pkgs inputs; };
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
  programs.hyprland = {
    enable = true;
    withUWSM = true;
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
