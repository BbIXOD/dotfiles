{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flutter
    nodejs
    deno
    python315
    dotnet-sdk
    gcc
    clang
    dart
    supabase-cli
    unityhub
    rustc
    cargo

    gnumake
    cmake
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
