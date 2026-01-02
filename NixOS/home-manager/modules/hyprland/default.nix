{pkgs, ...}: {
  imports =  [
    ./config
    ./hyprpaper.nix
#    ./hyprpanel.nix
    ./hypridle.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    configPackages = [ pkgs.hyprland ];
  };

  programs.hyprlock.enable = true;
}
