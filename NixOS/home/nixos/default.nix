{pkgs, inputs, ...}: 
{
  imports = [
    ./security.nix
    ./packages.nix
    ./printing.nix
    ./services.nix
    ./desktop
  ];

  system.stateVersion = "25.05";
}
