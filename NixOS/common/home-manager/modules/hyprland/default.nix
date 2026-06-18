{pkgs, ...}: {
  imports =  [
    ./config
#    ./hypridle.nix
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
