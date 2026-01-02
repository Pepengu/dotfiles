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

    google-chrome

    vscode-fhs

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
