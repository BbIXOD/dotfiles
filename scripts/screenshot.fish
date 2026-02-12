#!/usr/bin/env fish

set filename "$XDG_PICTURES_DIR/(date +'%Y-%m-%d-%H%M%S').png"

set mode region

for arg in $argv
    switch $arg
        case -f --fullscreen
            set mode fullscreen
        case -w --window
            set mode window
    end
end

switch $mode
    case fullscreen
        grim - | wl-copy

    case window
        set geom (slurp -f '%x,%y %wx%h' -w)
        grim -g "$geom" - | wl-copy

    case region
        slurp | grim -g - - | wl-copy
end

wl-paste > "$filename"
