{home-manager, nixpkgs, zen-browser, nixvim, capybar, sops-nix, inputs, pkgs, commonPath, ...}:
let
  commonNixos = commonPath + "/nixos/default.nix";
  commonHomeManager = commonPath + "/home-manager/default.nix";
in
{
  homeConfigurations.server = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {inherit inputs;};
    modules = [
      zen-browser.homeModules.default
      nixvim.homeManagerModules.nixvim
      capybar.homeManagerModules.default
      sops-nix.homeManagerModules.sops
      commonHomeManager
      ./home-manager
    ];
  };

  nixosConfigurations."server" = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    system = "x86_64-linux";
    modules = [
      commonNixos
      ./nixos
      ./hardware.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.extraSpecialArgs = {inherit inputs;};
        home-manager.users.daniil = {
          imports = [
            zen-browser.homeModules.default
            nixvim.homeManagerModules.nixvim
            capybar.homeManagerModules.default
            sops-nix.homeManagerModules.sops
            commonHomeManager
            ./home-manager
          ];
        };
        home-manager.backupFileExtension = "backup";
      }
    ];
  };
}

