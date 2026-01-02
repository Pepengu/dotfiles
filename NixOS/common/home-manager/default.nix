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
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;
}
