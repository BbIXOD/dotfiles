{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flutter
    nodejs
    deno
    python315
    rustup
    dotnet-sdk
    gcc

    dart
    supabase-cli

    gnumake
    cmake
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
