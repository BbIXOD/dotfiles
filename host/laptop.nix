{ pkgs, lib, ... }:
{
  environment.etc."greetd/sway-greeter-config".text = lib.mkForce ''
    default_border none
    default_floating_border none
    gaps inner 0
    gaps outer 0
    for_window [app_id="kitty"] fullscreen enable



    output eDP-1 disable

    input * {
        xkb_layout "us"
        repeat_delay 400
        repeat_rate 40
    }
    input type:touchpad {
        tap enabled
    }

    # hide cursor after 1 second of inactivity
    seat * hide_cursor 1000

    # Startup applications
    # Start gslapper with default wallpaper (forked to background with IPC socket)
    exec gslapper -f -I /tmp/sysc-greet-wallpaper.sock '*' /usr/share/sysc-greet/wallpapers/sysc-greet-default.png
    exec "XDG_CACHE_HOME=/tmp/greeter-cache HOME=/var/lib/greeter ${pkgs.kitty}/bin/kitty --start-as=fullscreen --config=/etc/greetd/kitty.conf /nix/store/j1sg6zjkn95dccidyqdy0y3870628f3w-sysc-greet-1.0.7/bin/sysc-greet; /nix/store/5dql40plq59lzyz999flqmd4fvdm07yd-sway-1.11/bin/swaymsg exit"
  '';

  nix.settings = {
    cores = 5;
    max-jobs = 2;
  };
  systemd.services.nix-daemon.serviceConfig = {
    MemoryHigh = "5G";
    MemoryMax = "6G";
  };

}
