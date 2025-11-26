_: {
    imports = [
        ./rust.nix
        ./tex.nix
        ./cpp.nix
        ./typst.nix
    ];

    plugins = {
        lsp = {
            servers = {
                cssls.enable = true;
                ts_ls.enable = true;
                nil_ls.enable = true;
                taplo.enable = true;
            };
        };
    };
}
