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
    font = "${config.stylix.fonts.serif.name} 20";
    theme = lib.mkDefault (config.lib.stylix.colors {
      template = builtins.readFile ./theme.rasi;
      extension = "rasi";
    });
  };

  home.packages = [
  ];
}
