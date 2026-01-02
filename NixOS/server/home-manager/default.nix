{inputs, pkgs, ...}:
let
  username = "daniil";
in {
  imports = [
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;
}

