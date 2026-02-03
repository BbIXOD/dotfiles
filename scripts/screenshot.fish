#!/usr/bin/env fish

set filename "$XDG_PICTURES_DIR/$(date +'%Y-%m-%d-%H%M%S.png')"
slurp | grim -g - - | wl-copy && wl-paste > "$filename"


