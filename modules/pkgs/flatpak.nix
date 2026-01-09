{ config, username, ... }:
{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "com.usebottles.bottles"
    ];
    overrides = {
      "com.usebottles.bottles".Context = {
        filesystems = [
          "${config.users.users.${username}.home}/bottles"
          "${config.users.users.${username}.home}/downloads/torrents"
        ];
        sockets = [
          "x11"
          "wayland"
          "pulseaudio"
        ];
        share = [
          "network"
        ];

      };
    };
  };
}
