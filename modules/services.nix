{ pkgs, ... }:

{
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.upower.enable = true;
  services.udisks2.enable = true;
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    interval = "daily";
  };
}
