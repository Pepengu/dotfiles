{ config, pkgs, lib, ... }:
let
  cursorTheme  = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
  cursorSize   = 16; 
in
{
  home.pointerCursor = {
    name = cursorTheme;
    package = cursorPackage;
    size = cursorSize;
    gtk.enable = true; 
    x11.enable = true; 
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorTheme;
    XCURSOR_SIZE  = toString cursorSize;
    HYPRCURSOR_THEME = cursorTheme;
    HYPRCURSOR_SIZE  = toString cursorSize;
  };

  wayland.windowManager.hyprland = lib.mkIf
    (config.wayland.windowManager.hyprland.enable or false)
    {
      settings.env = [
        "XCURSOR_THEME,${cursorTheme}"
        "XCURSOR_SIZE,${toString cursorSize}"
        "HYPRCURSOR_THEME,${cursorTheme}"
        "HYPRCURSOR_SIZE,${toString cursorSize}"
      ];
    };
}
