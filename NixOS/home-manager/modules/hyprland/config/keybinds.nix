{lib, ... }: {
    wayland.windowManager.hyprland.settings = 
    let 
        directions = {
            left = "l";
            down = "d";
            up = "u";
            right = "r";
            h = "l";
            j = "d";
            k = "u";
            l = "r";
        };
        workspaces = [
            "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
        ];
    in {
        "$mainMod" = "SUPER";

        bind = [
            "$mainMod, S, exec, rofi -show drun -show-icons"
            "$mainMod, B, exec, ags -t bar-0"
            "$mainMod, Q, exec, ghostty"
            "$mainMod, C, killactive, "
            "$mainMod, M, exit, "
            "$mainMod, E, exec, thunar"
            "$mainMod, V, togglefloating, "
            ", Print, exec, hyprshot -m region --clipboard-only"
            "SHIFT, Print, exec, hyprshot -m active -m output -- gimp"
        ] 
            ++ (map (n: "$mainMod, ${n}, workspace, ${n}") workspaces) # Switch workpace
            ++ (map (n: "$mainMod SHIFT, ${n}, movetoworkspace, ${n}") workspaces) # Move tab to workspace
            ++ (lib.mapAttrsToList (key: direction: "$mainMod,${key}, movefocus,${direction}") directions) # Change focus
        ;

# Media Keys

        bindel = [
            ", XF86AudioMute,        exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

            ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioMicMute,     exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

            ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ", XF86MonBrightnessUp,   exec, brightnessctl s 10%+"
        ];

        #swayosd version
#        bindel = [
#            ",XF86AudioRaiseVolume,exec,swayosd-client --output-volume raise"
#            ",XF86AudioLowerVolume,exec,swayosd-client --output-volume lower"

#            ",XF86AudioMute,exec,swayosd-client --output-volume mute-toggle"

#            ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"

#            ",XF86MonBrightnessUp,exec,swayosd-client --brightness raise"
#            ",XF86MonBrightnessDown,exec,swayosd-client --brightness lower"
#        ];

# Mouse keys
        bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
        ];
    };
}
