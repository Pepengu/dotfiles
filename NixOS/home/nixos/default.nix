{pkgs, inputs, ...}: 
{
  imports = [
    ./security.nix
    ./packages.nix
    ./printing.nix
    ./services.nix
    ./zapret.nix
    ./desktop
  ];

  system.stateVersion = "26.05";
}
