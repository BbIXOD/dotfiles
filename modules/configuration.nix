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
      "video"
      "render"
    ];
  };

  system.stateVersion = "25.11";
}
