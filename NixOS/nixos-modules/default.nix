{pkgs, inputs, ...}: 
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
#    ./docker.nix

    ./desktop
  ];

  services = {
    v2raya.enable = true;
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        hplip
        cups-filters
        cups-browsed
      ];
    };
    ipp-usb.enable = true;
  };

  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };

  environment.systemPackages = with pkgs; [
    nodejs
    home-manager
    inputs.prismlauncher.packages.${system}.prismlauncher 
    inputs.zen-browser.packages.${system}.default
    simple-scan
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
