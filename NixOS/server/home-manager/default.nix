{inputs, pkgs, ...}:
let
  username = "daniil";
in {
  imports = [
    ./modules
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };

  nixpkgs.config.allowUnfree = true;
}

