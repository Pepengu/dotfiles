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
    font = lib.mkForce "${config.stylix.fonts.serif.name} 20";
    theme = lib.mkForce ./theme.rasi;
  };

  home.packages = [
  ];
}
