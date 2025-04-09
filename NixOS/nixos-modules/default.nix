_: {
    nix.settings.experimental-features = ["nix-command" "flakes"];

    imports = [
       ./packages.nix
       ./firefox.nix
#       ./rustup.nix

       ./desktop
    ];

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "24.11";
}
