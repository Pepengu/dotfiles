{inputs, pkgs, ...}: 
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  imports = [
  ];

  home.packages = with pkgs; [
    jre
  ];

  programs = {
  };

  services = {
    swayosd.enable = true;
  };
}

