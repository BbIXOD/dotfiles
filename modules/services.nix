{ pkgs, ... }:

{
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.upower.enable = true;
  hardware.bluetooth.enable = true;
  services.udisks2.enable = true;
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    interval = "daily";
  };
}
