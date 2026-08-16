{config, pkgs, ...}: let
  wallpaper = config.backgrounds."background.jpg";
in {
  home.packages = [ pkgs.hyprpaper ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    wallpaper[eDP-1]:monitor = eDP-1
    wallpaper[eDP-1]:path = ${wallpaper}
    wallpaper[HDMI-A-1]:monitor = HDMI-A-1
    wallpaper[HDMI-A-1]:path = ${wallpaper}
  '';
}
