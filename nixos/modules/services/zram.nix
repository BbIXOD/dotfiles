{ config, pkgs, lib, ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
