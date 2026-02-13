{ config }:
dir: prefix:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;

  files = builtins.attrNames (builtins.readDir dir);

  mkEntry = name: {
    name = "${prefix}/${name}";
    value.source = mkLink "${dir}/${name}";
  };
in
builtins.listToAttrs (map mkEntry files)
