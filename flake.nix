{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nightfox = {
      url = "github:EdenEast/nightfox.nvim";
      flake = false;
    };
    forkprince.url = "github:forkprince/nur-packages";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    sysc-greet.url = "github:Nomadcxx/sysc-greet";
    mango.url = "github:DreamMaoMao/mango";
    xremap.url = "github:xremap/nix-flake";

    forkprince.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    sysc-greet.inputs.nixpkgs.follows = "nixpkgs";
    mango.inputs.nixpkgs.follows = "nixpkgs";
    xremap.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "maksym";
      nixDir = "/home/${username}/nixos";
      readDir =
        dir:
        builtins.filter (path: nixpkgs.lib.hasSuffix ".nix" (toString path)) (
          nixpkgs.lib.filesystem.listFilesRecursive dir
        );
      pkgsConfig = {
        allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs username nixDir;
        };
        modules = builtins.concatLists [
          [
            inputs.home-manager.nixosModules.home-manager
          ]
          (readDir ./host)
          (readDir ./modules)
          [
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs username nixDir; };
                useUserPackages = true;
                sharedModules = [ { nixpkgs.config = pkgsConfig; } ];
                backupFileExtension = "hm-backup";
                users.${username}.imports = readDir ./home;
              };
              nixpkgs.config = pkgsConfig;
            }
          ]
        ];
      };
    };
}
