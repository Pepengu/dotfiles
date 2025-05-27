_: {
    imports =  [
        ./config
        ./hyprpaper.nix
        ./hyprpanel.nix
        ./hyprlock.nix
        ./hypridle.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
}
