{
  description = "Pepengu's desktop flake";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
  };

  inputs = {
    # NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Desktop Environment
    hyprland.url = "github:hyprwm/Hyprland";

    # System Management
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets Management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Theming
    base16-schemes = {
      url = "github:tinted-theming/base16-schemes";
      flake = false;
    };

    # Applications
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    capybar.url = "github:CapyCore/capybar/dev";

    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
    };

    # Development Tools
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cursor = {
      url = "github:Distracted-E421/nixos-cursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    capybar,
    zen-browser,
    prismlauncher,
    nixos-cursor,
    sops-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [];
    };

    # Get all config directories (excluding common)
    configDir = ./NixOS;
    configDirs = builtins.filter
      (name: name != "common")
      (builtins.attrNames (builtins.readDir configDir));

    # Import a config directory and get its outputs
    importConfig = configName: let
      configPath = configDir + "/${configName}";
      commonPath = configDir + "/common";
      config = import (configPath + "/default.nix") {
        inherit home-manager nixpkgs zen-browser nixvim capybar nixos-cursor sops-nix inputs pkgs;
        inherit commonPath;
      };
    in
      config;

    # Merge all config outputs
    allConfigs = builtins.map importConfig configDirs;
    mergedHomeConfigs = builtins.foldl'
      (acc: config: acc // (config.homeConfigurations or {}))
      {}
      allConfigs;
    mergedNixosConfigs = builtins.foldl'
      (acc: config: acc // (config.nixosConfigurations or {}))
      {}
      allConfigs;
  in {
    overlays.default = final: prev: {
      dockerfile-language-server =
        (prev.nodePackages_latest.dockerfile-language-server-nodejs
          or prev.nodePackages.dockerfile-language-server-nodejs);
    };

    homeConfigurations = mergedHomeConfigs;
    nixosConfigurations = mergedNixosConfigs;
  };
}
