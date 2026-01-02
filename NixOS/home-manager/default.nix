{inputs, pkgs, ...}:
let
  username = "daniil";
in {
  imports = [
    ./modules
    ./backgrounds
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;
}
