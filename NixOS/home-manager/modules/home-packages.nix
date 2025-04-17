{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    brightnessctl

    vscode
    telegram-desktop
    hyprshot
    vlc
    dolphin

    # Fonts
    font-awesome
    iosevka
    inter
    liberation_ttf
    nerdfonts
    open-sans
  ];

}
