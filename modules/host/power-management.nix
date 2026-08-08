{ pkgs, inputs, ... }:
let
  tlp = pkgs.tlp.overrideAttrs (old: {
    version = "git-${builtins.substring 0 8 inputs.tlp-src.rev}";
    src = inputs.tlp-src;
    patches = builtins.tail old.patches;
    postPatch = (old.postPatch or "") + ''
      substituteInPlace Makefile \
        --replace-fail '|@TLP_SBIN@|$(TLP_SBIN)|' '|@TLP_SBIN@|$(_SBIN)|' \
        --replace-fail '|@TLP_TLIB@|$(TLP_TLIB)|' '|@TLP_TLIB@|$(_TLIB)|' \
        --replace-fail '|@TLP_FLIB@|$(TLP_FLIB)|' '|@TLP_FLIB@|$(_FLIB)|' \
        --replace-fail '|@TLP_ULIB@|$(TLP_ULIB)|' '|@TLP_ULIB@|$(_ULIB)|' \
        --replace-fail '|@TLP_BATD@|$(TLP_BATD)|' '|@TLP_BATD@|$(_BATD)|' \
        --replace-fail '|@TLP_CONFDEF@|$(TLP_CONFDEF)|' '|@TLP_CONFDEF@|$(_CONFDEF)|' \
        --replace-fail '|@TLP_CONFREN@|$(TLP_CONFREN)|' '|@TLP_CONFREN@|$(_CONFREN)|' \
        --replace-fail '|@TLP_CONFDPR@|$(TLP_CONFDPR)|' '|@TLP_CONFDPR@|$(_CONFDPR)|'
    '';
  });
in
{
  services = {
    power-profiles-daemon.enable = false;

    tlp = {
      enable = true;
      package = tlp;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        START_CHARGE_THRESH_BAT0 = 50;
        STOP_CHARGE_THRESH_BAT0 = 80;

      };
    };
  };
}
