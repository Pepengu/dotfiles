_: {
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

  programs.hyprlock.enable = true;
}
