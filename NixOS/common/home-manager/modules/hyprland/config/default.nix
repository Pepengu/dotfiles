{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./keybinds.nix
    ./windows.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
