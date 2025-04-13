{config, ...}: let
    wallpaper = config.stylix.image;
in {
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = false;
            preload = [
                "${wallpaper}"
            ];
            wallpaper = [
                "eDP-1,${wallpaper}"
            ];
        };
    };
}
