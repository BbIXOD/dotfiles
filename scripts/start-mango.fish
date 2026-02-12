#!/usr/bin/env fish

systemctl --user import-environment \
    XDG_CURRENT_DESKTOP \
    XDG_SESSION_TYPE \
    QT_QPA_PLATFORM \
    XDG_DATA_DIRS \
    WAYLAND_DISPLAY \
    DISPLAY \
    PATH

systemctl --user start mango-session.target
