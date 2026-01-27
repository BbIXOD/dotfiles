# Nix files

## Description

Basically my personal files for nixos

## Usage

### Cloning

run following commands:

```
cd ~
git clone https://github.com/BbIXOD/dotfiles nixos
```

### Configuring

After cloning the repo check the host folder.
It contains machine-specific config.
Replace `hardware-configuration.nix` with your own.
Review other files there.

`flake.nix` has some variables like username,
you may want to change them.

### Rebuilding 

```
cd ~/nixos/
sudo nixos-rebuild switch \
  --extra-experimental-features 'nix-command flakes' \
  --flake . \
  --impure
```

## Post install manual steps

- for unity plugin
  `dotnet add package Microsoft.Unity.Analyzers --version 1.19.0` and so on
  at [nvim-unity](https://github.com/walcht/neovim-unity?tab=readme-ov-file)
- ofc steam and bottles are manual
- prob get wallpapers
- reduce mic internal boost with aslactl
