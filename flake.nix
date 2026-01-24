{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    forkprince.url = "github:forkprince/nur-packages";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nightfox.url = "github:EdenEast/nightfox.nvim";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "maksym";
      nixDir = "/home/${username}/nixos";
      readDir = nixpkgs.lib.filesystem.listFilesRecursive;
      pkgs = nixpkgs.legacyPackages.${system};
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
            # inputs.catppuccin.nixosModules.catppuccin
          ]
          (readDir ./host)
          (readDir ./modules)
          [
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs username nixDir; };
                useUserPackages = true;
                useGlobalPkgs = true;
                backupFileExtension = "hm-backup";
                users.${username}.imports = readDir ./home;
              };
              nix.settings = {
                extra-substituters = [ "https://vicinae.cachix.org" ];
                extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
              };
            }
          ]
        ];
      };

      homeConfigurations.${username} = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs username; };
        modules = readDir ./home;
      };
    };
}
