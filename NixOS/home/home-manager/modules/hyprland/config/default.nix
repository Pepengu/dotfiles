{pkgs, lib, ...}: let
  luaFiles = builtins.readFile;
  commonLuaDir = ../../../../../common/home-manager/modules/hyprland/config/lua;
  luaDir = ./lua;
in {
  xdg.configFile."hypr/hyprland.lua".text = lib.mkForce ''
    ${luaFiles (luaDir + "/monitors.lua")}
    ${luaFiles (commonLuaDir + "/settings.lua")}
    ${luaFiles (luaDir + "/keybinds.lua")}
    ${luaFiles (luaDir + "/windows.lua")}
  '';

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
