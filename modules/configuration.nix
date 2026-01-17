{
  inputs,
  pkgs,
  username,
  ...
}:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/user/my-nixos-config";
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  nix.settings.auto-optimise-store = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos";

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      curl
    ];
  };

  users.users."${username}" = {
    isNormalUser = true;
    description = "Maksym Diachok";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  users.users.max = {
    isNormalUser = true;
    description = "Maksym";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
  services.desktopManager.cosmic.enable = true;

  system.stateVersion = "25.11";

}
