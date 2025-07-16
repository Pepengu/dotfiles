{pkgs, ...}: {
  imports = [
    ./hyprland
    ./nvim
    ./rofi
    ./ghostty.nix
    ./git.nix
    ./theme.nix
    ./stylix.nix
    ./LaTeX.nix
    ./obs.nix
    ./capybar.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    hyprpicker

    vscode
    telegram-desktop
    hyprshot
    vlc
    zathura
    nautilus

    thunderbird
    ani-cli
    ani-skip

# Fonts
    font-awesome
    iosevka
    inter
    liberation_ttf
    open-sans
  ];

  programs = {
    fish.enable = true;
  };
}
