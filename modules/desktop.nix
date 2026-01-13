{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.sysc-greet.nixosModules.default
  ];
  programs.niri.enable = true;

  services.sysc-greet = {
    enable = true;
    compositor = "niri";
  };



  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command =
  #         "${pkgs.greetd.tuigreet}/bin/tuigreet"
  #         + " --time --remember-session --user-menu"
  #         + " --theme 'border=brightcyan;text=white;prompt=white;time=brightcyan;action=white;button=green;container=black;input=grey'";
  #       user = "greeter";
  #     };
  #   };
  # };
}
