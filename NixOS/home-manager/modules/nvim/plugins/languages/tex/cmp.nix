_: {
    plugins.cmp.filetype = {
        tex = {
            sources = [
                {
                    name = "omni";
                    trigger_characters = [ "{" "\\" ];
                }
                {name = "buffer";}
            ];
        };
    };
}
