{
  description = "Pepengu's desktop flake";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
  };

  inputs = {
#   Nixos
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
	    url = "github:nix-community/home-manager/release-25.05";
	    inputs.nixpkgs.follows = "nixpkgs";
    };

#   Theming
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    base16-schemes = {
      url = "github:tinted-theming/base16-schemes";
      flake = false;
    };

# Apps
    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

# Coding
    rust-overlay = {
        url = "github:oxalica/rust-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {nixpkgs, home-manager, stylix, catppuccin, nixvim, hyprpanel, ...} @ inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
          inherit system;
          overlays = [
          ];
      };
    in
  {
    homeConfigurations = {
      daniil = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
            stylix.homeModules.stylix
            catppuccin.homeModules.catppuccin
            nixvim.homeManagerModules.nixvim
            hyprpanel.homeManagerModules.hyprpanel

            ./NixOS/home-manager 
        ];
      };
    };

    nixosConfigurations."daniil" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./NixOS/nixos-modules
	    ./NixOS/hardware-configuration.nix
      
#        ({ pkgs, ... }: {
#         nixpkgs.overlays = [ rust-overlay.overlays.default ];
#         environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
#         })
      ];
    };
  };
}
