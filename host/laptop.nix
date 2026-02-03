{ pkgs, lib, ... }:
{
  environment.etc."greetd/niri-greeter-config.kdl".text = lib.mkForce ''
      hotkey-overlay {
        skip-at-startup
    }

    input {
        keyboard {
            xkb {
                layout "us"
            }
            repeat-delay 400
            repeat-rate 40
        }

        touchpad {
            tap;
        }
    }

    cursor {
        hide-when-typing
        hide-after-inactive-ms 1000
    }

    layer-rule {
        match namespace="^wallpaper$"
        place-within-backdrop true
    }

    layout {
        gaps 0
        center-focused-column "never"

        focus-ring {
            off
        }

        border {
            off
        }
    }

    animations {
        off
    }
    window-rule {
        match app-id="kitty"
        opacity 0.90
    }

    // Start gslapper with default wallpaper (forked to background with IPC socket)
    spawn-at-startup "gslapper" "-f" "-I" "/tmp/sysc-greet-wallpaper.sock" "*" "/usr/share/sysc-greet/wallpapers/sysc-greet-default.png"

    spawn-sh-at-startup "XDG_CACHE_HOME=/tmp/greeter-cache HOME=/var/lib/greeter ${pkgs.kitty}/bin/kitty --start-as=fullscreen --config=/etc/greetd/kitty.conf /nix/store/j1sg6zjkn95dccidyqdy0y3870628f3w-sysc-greet-1.0.7/bin/sysc-greet; /nix/store/0dvcjjv01iy6ranpqniw779i3p1r0868-niri-25.11/bin/niri msg action quit --skip-confirmation"

    // Empty binds block = no keybindings work (security for greeter)
    binds {
    }
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
