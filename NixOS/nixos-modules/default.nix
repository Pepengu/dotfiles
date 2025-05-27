_: {
    nix.settings.experimental-features = ["nix-command" "flakes"];

    imports = [
       ./packages.nix
       ./firefox.nix
       ./v2raya.nix
       ./docker.nix

       ./desktop
    ];

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.05";
}
