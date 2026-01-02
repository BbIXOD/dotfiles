{ config, ... }:
{
  services.flatpak = {
    enable = true;
    overrides = {
    "com.usebottles.bottles".Context.filesystems = [
      "${config.users.users.maksym.home}/bottles"
    ];
  };
  };
}
