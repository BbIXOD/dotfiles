{ config, pkgs, inputs, ... }:
{
  services.flatpak.enable = true;
  services.flatpak.overrides = {
    "com.usebottles.bottles".Context.filesystems = [
      "${config.users.users.maksym.home}/bottles"
    ];
  };
}
