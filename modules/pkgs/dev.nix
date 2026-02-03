{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flutter
    nodejs
    deno
    python315
    dotnet-sdk_10
    dotnet-sdk
    gcc
    clang
    dart
    supabase-cli
    unityhub
    rustc
    cargo
    jdk

    gnumake
    cmake
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
