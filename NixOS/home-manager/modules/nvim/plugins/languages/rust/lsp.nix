
_: {
    plugins = {
        lsp = {
            servers = {
                rust_analyzer = {
                    enable = true;
                    installRustc = true;
                    installCargo = true;
                };
            };
        };
    };

}
