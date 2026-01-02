{
  pkgs,
  config,
  lib,
  ...
}: let
  rofi = pkgs.rofi-wayland.override {
  plugins = with pkgs; [rofi-emoji rofi-power-menu];
};
in {
  programs.rofi = {
    enable = true;
    package = rofi;
    theme = lib.mkForce ./theme.rasi;
  };

  home.packages = [
  ];
}
