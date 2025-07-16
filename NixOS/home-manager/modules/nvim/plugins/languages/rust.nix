_:{
    globals.rustfmt_autosave = true;

    plugins = {
        cmp.filetype.rust = {
            sources = [
                { name = "nvim_lsp"; }
                {
                    name = "buffer"; 
                    option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                    keywordLength = 3;
                }
                {
                    name = "path"; 
                    keywordLength = 3;
                }
            ];
        };

        lsp.servers.rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;

            settings = {
                cargo = {
                    features = "all";
                };
            };
        };
    };
}
