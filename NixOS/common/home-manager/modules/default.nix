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
    ./gh.nix
#    ./vscode.nix
    # ./secrets.nix  # Uncomment after setting up secrets (see secrets/README.md)
    ./theme.nix
    ./capybar.nix
    ./zen.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    hyprpicker
    btop
    ripgrep
    unzip

    google-chrome

    telegram-desktop
    vesktop
    hyprshot
    vlc
    zathura
    nautilus
    gimp
    amnezia-vpn

    thunderbird
    jre

    xdg-utils

# Fonts
    font-awesome
    iosevka
    inter
    liberation_ttf
    open-sans
  ];

  services = {
    #swayosd.enable = true;
  };
}
