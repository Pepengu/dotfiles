{pkgs, inputs, ...}: 
{
  imports = [
    ./nix.nix
    ./security.nix
    ./packages.nix
    ./printing.nix
    ./services.nix
    ./desktop
    ./docker.nix  # Uncomment to enable Docker
  ];

  system.stateVersion = "25.05";
}
