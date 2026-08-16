{pkgs, ...}: let
  luaFiles = builtins.readFile;
  luaDir = ./lua;
in {
  xdg.configFile."hypr/hyprland.lua".text = ''
    ${luaFiles (luaDir + "/monitors.lua")}
    ${luaFiles (luaDir + "/settings.lua")}
    ${luaFiles (luaDir + "/keybinds.lua")}
    ${luaFiles (luaDir + "/windows.lua")}
  '';

  wayland.windowManager.hyprland.settings = {};

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
