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

    ./LaTeX.nix  
    ./obs.nix
  ];

  home.packages = with pkgs; [
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher

    google-chrome

    unstable.code-cursor
    ollama

    libreoffice

    thunderbird
    ani-cli
    ani-skip
    jre

    typst
    elixir
  ];

  programs = {
  };

  services = {
    swayosd.enable = true;
  };
}
