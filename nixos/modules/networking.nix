{ ... }:
{
  networking.nameservers = ["9.9.9.9"];
  networking.networkmanager.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
