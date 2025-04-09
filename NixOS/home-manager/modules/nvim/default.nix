_: {
    home.shellAliases.v = "nvim";

    programs.nixvim = {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;

        imports = [
            ./settings.nix
            ./remap.nix
            ./plugins
        ];
    };
}
