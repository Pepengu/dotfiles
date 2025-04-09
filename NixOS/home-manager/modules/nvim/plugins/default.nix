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
    };

    colorschemes = {
        catppuccin = {
            enable = true;

            settings = {
                flavour = "mocha";
            };
        };
    };
}
