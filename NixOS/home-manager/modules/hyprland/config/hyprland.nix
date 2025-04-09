_: {
    wayland.windowManager.hyprland.settings = {
        exec-once = [
#            "hyprlock -c ~/.config/hypr/hyprlock.conf"
            "brigtnessctl s 451"
            "hyprpanel"
#            "nix run ./../../astal"
#            "ags"
            "hyprpaper"
            "nm-applet --indicator "
#            "dunst "
#            "sudo v2rayA "
        ];

        monitor = [
            "eDP-1, 1920x1200@60.03Hz, 0x0, 1"
            "HDMI-A-2,preferred,auto,1,mirror,eDP-1"
        ];

        input = {
            kb_layout = "us, ru";
            kb_options = "grp:win_space_toggle";

            follow_mouse = 1;

            touchpad  = {
                natural_scroll = "yes";
            };

            sensitivity = 0; 
        };

        general = {

            gaps_in = 5;
            gaps_out = "5, 2, 2, 2";
            border_size = 1;
#            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
#            "col.inactive_border" = "rgba(595959aa)";

            layout = "dwindle";

            allow_tearing = false;
        };


        decoration = {
            rounding = 10;
            blur = {
                enabled = false;
                size = 1;
                passes = 1;
            };
        };


        animations = {
            enabled = "yes";

            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [ 
                "windows, 1, 7, myBezier"
                "windowsOut, 1, 7, default, popin 80%"
                "border, 1, 10, default"
                "borderangle, 1, 8, default"
                "fade, 1, 7, default"
                "workspaces, 1, 6, default"
            ];
        };

        dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
        };
    };
}
