{
  inputs,
  pkgs,
  username,
  ...
}:
{
  programs.niri.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  environment.systemPackages = with pkgs; [ libxcursor ];
  services.displayManager.dms-greeter = {
    enable = true;
    compositor = {
      name = "niri";
    };

    configHome = "/home/${username}";

    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };

    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
  };
}
