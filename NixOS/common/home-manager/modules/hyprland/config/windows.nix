_: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1 silent] ghostty"
      "[workspace 2 silent] zen-beta"
      "[workspace 3 silent] telegram-desktop"
    ];

    windowrulev2 = [
      "noborder, onworkspace:w[t1]"
    ];
  };
}
