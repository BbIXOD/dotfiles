{ pkgs, inputs }:
{
  mango = inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.mango;
  # mango = inputs.mango.packages.${system}.mango.overrideAttrs (old: {
  #   patches = (old.patches or []) ++ [ "${inputs.mango-zoom}/screen-zoom.patch" ];
  # });
}
