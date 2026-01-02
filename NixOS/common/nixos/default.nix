{pkgs, inputs, ...}: 
{
  imports = [
    ./nix.nix
    ./docker.nix
    ./security.nix
    ./desktop
  ];
}
