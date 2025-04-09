_: {
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "[workspace 2 silent] firefox"
            "[workspace 4 silent] telegram-desktop"
        ];

        windowrule = [
            "float, ^(pavucontrol)$"
            "size 500 500, ^(pavucontrol)$"
            "move 100%-500 40, ^(pavucontrol)$"
        ];

        windowrulev2 = [
            "noborder, onworkspace:w[t1]"
        ];
    };
}
