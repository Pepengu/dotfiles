{pkgs, ...}:{ 
    plugins = {
        cmp.filetype.tex = {
            sources = [
            {
                name = "omni";
                trigger_characters = [ "{" "\\" ];
            }
            {name = "buffer";}
            ];
        };

        lsp = {
            servers = {
                texlab = {
                    enable = true;
                };
            };
        };

        vimtex = {
            enable = true;
            texlivePackage = pkgs.texliveFull;

            settings = {
                quickfix_enabled = true;
                quickfix_open_on_warning = false;

                quickfix_ignore_filters = [
                    "Underfull"
                    "Overfull"
                    "specifier changed to"
                    "Token not allowed in a PDF string"
                ];


                syntax_enable = false;
                completion = true;

                view_method = "zathura";

                compiler_method = "latexmk";
                compiler_latexmk = {
                    aux_dir = "./aux";
                };
            };
        };
    };
  }
