_: {
    plugins = {
        lsp = {
            enable = true;

            keymaps = {
                silent = true;
                diagnostic = {
                    "<leader>E" = "open_float";
                    "[" = "goto_prev";
                    "]" = "goto_next";
                    "<leader>do" = "setloclist";
                };
                lspBuf = {
                    K = "hover";
                    gd = "definition";
                    gD = "references";
                    gt = "type_definition";
                    gi = "implementation";
                    "<leader>cr" = {
                        action = "rename";
                        desc = "Rename";
                    };
                };
            };

            servers = {
                lua_ls.enable = true;
                nil_ls.enable = true;
            };
        };
    };

}
