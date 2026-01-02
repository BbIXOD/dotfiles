{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flutter
      dart
      nodejs
      python315
      rustup
      dotnet-sdk
      gcc

      gnumake
      cmake
  ];

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [];
}
