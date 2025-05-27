_: {
    imports = [
        ./languages

        ./undotree.nix
        ./lsp.nix
        ./cmp.nix
        ./harpoon.nix
        ./treesitter.nix
        ./competitest.nix
    ];
    plugins = {
        lualine.enable = true;
        codecompanion = {
            enable = true;
        };
    };

    colorschemes = {
        tokyonight = {
            enable = true;
        };
        
        catppuccin = {
            enable = false;

            settings = {
                flavour = "mocha";
            };
        };
    };
}
