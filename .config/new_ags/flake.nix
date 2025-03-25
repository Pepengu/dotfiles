{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, astal }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = astal.lib.mkLuaPackage {
      inherit pkgs;
      name = "ags"; # how to name the executable
      src = /home/daniil/.config/new_ags; # should contain init.lua

      # add extra glib packages or binaries
      extraPackages = [
        astal.packages.${system}.battery
        astal.packages.${system}.hyprland
        astal.packages.${system}.tray
        pkgs.dart-sass
      ];
    };
  };
}
