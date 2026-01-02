{pkgs, ...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [ "root" "@wheel" ];
    allowed-users = [ "@wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
}
