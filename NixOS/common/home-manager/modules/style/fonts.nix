{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    nerd-fonts.symbols-only

    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    noto-fonts-emoji

    inter
    roboto
    source-sans-pro
    source-serif-pro
    source-code-pro

    font-awesome
    material-design-icons
  ] ;

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      serif = [ "Noto Serif" "Source Serif Pro" ];
      sansSerif = [ "Inter" "Noto Sans" "Roboto" ];
      monospace = [
        "JetBrainsMono Nerd Font"
        "FiraCode Nerd Font"
        "Iosevka Nerd Font"
        "Source Code Pro"
      ];

      emoji = [ "Noto Color Emoji" ];
    };
  };
}
