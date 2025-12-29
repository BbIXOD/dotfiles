{ config, pkgs, inputs, ... }:
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
}
