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
    stateVersion = "26.05";
  };

  nixpkgs.config.allowUnfree = true;
}
