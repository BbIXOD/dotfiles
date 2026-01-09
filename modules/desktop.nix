{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.mango.nixosModules.mango ];
  programs.mango.enable = true;
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [ sddm-astronaut ];

  services = {
    xserver.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = false;
        theme = "sddm-astronaut-theme";
        extraPackages = [ pkgs.sddm-astronaut ];
      };
    };
  };
}
