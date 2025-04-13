{pkgs, ...}: {
    plugins.vimtex = {
        enable = true;
        texlivePackage = pkgs.texliveFull;

        settings = {
            quickfix_enabled = true;
            quickfix_open_on_warning = false;

            # Ignore undesired errors and warnings
            quickfix_ignore_filters = [
                "Underfull"
                "Overfull"
                "specifier changed to"
                "Token not allowed in a PDF string"
            ];


            syntax_enable = false;
            completion = true;

            compiler_method = "latexmk";
            compiler_latexmk = {
                aux_dir = "./aux";
            };
        };
    };
}
