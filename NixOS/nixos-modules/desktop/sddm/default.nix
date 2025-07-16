{pkgs, ...}: let
  sddmTheme = import ./sddm-tokio-night.nix {inherit pkgs;};
in {
  qt = {
    enable = true;
    platformTheme = "gtk2";
  };

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${sddmTheme}";
    };
  };


  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
