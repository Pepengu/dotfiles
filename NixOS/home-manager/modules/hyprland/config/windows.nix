_: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 2 silent] ghostty"
      "[workspace 2 silent] zen"
      "[workspace 3 silent] telegram-desktop"
    ];

    windowrulev2 = [
      "noborder, onworkspace:w[t1]"
    ];
  };
}
