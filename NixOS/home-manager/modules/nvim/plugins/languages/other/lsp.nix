_: {
    plugins = {
        lsp = {
            servers = {
                nixd.enable = true;
                cssls.enable = true;
                ts_ls.enable = true;
                taplo.enable = true;
            };
        };
    };
}
