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
  ];
}
