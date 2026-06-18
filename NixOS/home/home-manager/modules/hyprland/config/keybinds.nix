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
      "$mainMod, B, exec, dms ipc call bar toggle id default"
      "$mainMod, T, exec, ghostty"
      "$mainMod, P, exec, hyprpicker"
      "$mainMod, K, killactive, "
      "$mainMod, M, exit, "
      "$mainMod, E, exec, nautilus"
      "$mainMod, F, togglefloating, "
      ", Print, exec, hyprshot -m region --clipboard-only"
      "SHIFT, Print, exec, hyprshot -m active -m output -- gimp"
      "$mainMod, SPACE, exec, " #fix for inserting <D-space> in neovim when changing layout. 
      #Why it fixes it? No fucking clue.
      ", ALT, pass, class:^(vesktop)$"
    ] 
    ++ (map (n: "$mainMod, ${n}, workspace, ${n}") workspaces)
    ++ (map (n: "$mainMod SHIFT, ${n}, movetoworkspace, ${n}") workspaces)
    ++ (lib.mapAttrsToList (key: direction: "$mainMod,${key}, movefocus,${direction}") directions)
    ;

        bindel = [
            ",XF86AudioRaiseVolume,exec,swayosd-client --output-volume raise"
            ",XF86AudioLowerVolume,exec,swayosd-client --output-volume lower"
            ",XF86AudioMute,exec,swayosd-client --output-volume mute-toggle"
            ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
            ",XF86MonBrightnessUp,exec,swayosd-client --brightness raise"
            ",XF86MonBrightnessDown,exec,swayosd-client --brightness lower"
        ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
    ];
  };
             }
