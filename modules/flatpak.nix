{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "com.usebottles.bottles"
      "com.github.tchx84.Flatseal"
    ];
    overrides = {
      "com.usebottles.bottles".Context = {
        filesystems = [
          "~/games"
          "xdg-data/Steam"
        ];
      };
    };
  };
}
