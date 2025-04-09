{pkgs, ...}: {
    plugins.treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            bash
            json
            lua
            markdown
            nix
            toml
            vim
            vimdoc
            rust
            latex
            cpp
        ];

        settings = {
#            ensure_installed = "all";

            highlight.enable = true;
        };

        nixvimInjections = true;
    };
}
