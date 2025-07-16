{pkgs, inputs, ...}: 
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
#    ./docker.nix

    ./desktop
  ];

  services = {
     v2raya.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nodejs

    home-manager

    inputs.zen-browser.packages.${system}.default
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
