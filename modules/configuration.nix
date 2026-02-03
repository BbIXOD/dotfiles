{
  pkgs,
  username,
  nixDir,
  ...
}:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 5";
    flake = nixDir;
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  documentation.enable = false;

  nix.settings = {
    auto-optimise-store = true;
    substituters = [ "https://vicinae.cachix.org" ];
    trusted-substituters = [
      "https://vicinae.cachix.org"
      "https://cache.nixos.org"
    ];
    extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
    builders-use-substitutes = true;
    fallback = false;
  };

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

  system.stateVersion = "25.11";
}
