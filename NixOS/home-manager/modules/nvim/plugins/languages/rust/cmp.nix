_: {
    plugins.cmp.filetype = {
        rs = {
            sources = [
            { name = "git"; }
            { name = "nvim_lsp"; }
            {
                name = "buffer"; # text within current buffer
                    option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                keywordLength = 3;
            }
            {
                name = "path"; # file system paths
                    keywordLength = 3;
            }
                ];
        };
    };
}
