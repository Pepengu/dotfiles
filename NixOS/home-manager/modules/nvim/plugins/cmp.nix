_: {
    plugins = {
        cmp = {
            enable = true;
            autoEnableSources = true;
            settings = {
                performance = {
                    debounce = 60;
                    fetchingTimeout = 200;
                    maxViewEntries = 10;
                };

                mapping = {
                    "<C-y>" = # Lua
                        "cmp.mapping.confirm({ select = true })";
                    "<C-n>" = # Lua
                        "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
                    "<C-p>" = # Lua
                        "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
                };
            };

        };

        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;
        cmp-path.enable = true;
        cmp-cmdline.enable = true;
    };
}
