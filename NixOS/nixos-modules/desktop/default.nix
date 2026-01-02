{pkgs, ...}: {
  imports = [
    #./sddm
    ./hyprland.nix
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./fonts.nix
    ./pipewire.nix
    ./locale.nix
    ./bluetooth.nix
    ./steam.nix
  ];

  services = {
    logind.lidSwitch = "suspend-then-hibernate";
    upower.enable = true;
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    lldb
  ];

  environment.variables = rec {
    DISPLAY = "0";
  };
}
