{ self, lib, ... }:
let
  import-lib = func: import (self.outPath + "/lib/${func}.nix");
in
{
  _module.args.my-lib = lib.genAttrs [
    "mime-for"
  ] import-lib;
}
