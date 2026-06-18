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
#    ./helix

    ./LaTeX.nix  
    ./obs.nix
    #./ashell.nix
    ./zed.nix
    #./codex-ollama.nix
  ];

  home.packages = with pkgs; [
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
    inputs.tg-ws-proxy.packages.${pkgs.system}.default

    google-chrome

    unstable.opencode
#    unstable.code-cursor

    libreoffice

    thunderbird
    ani-cli
    ani-skip
    jre
    
    python3
    clang-tools
    gcc
    typst
    elixir
    zig
    dbeaver-bin

    obsidian

    unstable.v2rayn
    unstable.xray

    hplip
  ];

  programs = {
  };

  xdg.dataFile = {

    "v2rayN/bin/xray/xray".source = "${pkgs.xray}/bin/xray";
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
    "v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-geoip}/share/v2ray/geoip.dat";
    "v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat";
  };
}
