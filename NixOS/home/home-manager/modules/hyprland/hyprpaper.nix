{config, ...}: let
  wallpaper = config.backgrounds."tokyonight-style.png";
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
