{inputs, pkgs, ...}: 
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  imports = [
    ./hyprland
    ./nvim
    ./style
    ./rofi
    ./terminal.nix
    ./git.nix
    ./theme.nix
    ./LaTeX.nix
    ./obs.nix
    ./capybar.nix
    ./zen.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    hyprpicker
    btop
    ripgrep

    vscode
    unstable.code-cursor

    libreoffice
    telegram-desktop
    vesktop
    hyprshot
    vlc
    zathura
    nautilus
    gimp
    amnezia-vpn

    thunderbird
    ani-cli
    ani-skip
    jre

    typst

# Fonts
    font-awesome
    iosevka
    inter
    liberation_ttf
    open-sans
  ];

  programs = {
  };

  services = {
    swayosd.enable = true;
  };
}
