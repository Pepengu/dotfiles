{config, ...}: let
    wallpaper = config.stylix.image;
in {
    programs.hyprpanel = {
        enable = true;
        overlay.enable = true;

        layout = {
            "bar.layouts" = {
                "0" = {
                    left = [ "workspaces" "kbLayout" ];
                    middle = [ "clock" ];
                    right = [ "volume" "mircrophone" "network" "bluetooth" "battery" "systray" "notifications" ];
                };
            };
        };

        settings = {
            bar = {
                clock.format = "%a, %d %b, %H:%M";
                
                workspaces = {
                    show_numbered = true;
                    workspaces = 5;
                };
            };

            menus = {
                clock = {
                    time = {
                        military = true;
                    };
                    weather = {
                        enabled = false;
                        location = "";   
                    };
                };
                dashboard = {
                    directories.enabled = false;
                    controls.enabled = false;
                    shortcuts.enabled = false;
                    stats.enabled = false;
                };
            };

            wallpaper = {
                enable = true;
                image = "${wallpaper}";
            };
        };
    };
}

