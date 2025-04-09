{pkgs, ...}: {
    imports = [
        ./hyprland.nix
        ./keybinds.nix
        ./windows.nix
        ./targets-config.nix
    ];

    home.packages = with pkgs; [
        wl-clipboard
    ];
}
