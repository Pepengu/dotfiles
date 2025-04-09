_: {
    imports =  [
        ./config
        ./hyprpaper.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
}
