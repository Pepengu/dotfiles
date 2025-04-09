{
    opts = {
        number = true;
        relativenumber = true;

        tabstop = 4;
        softtabstop = 4;
        shiftwidth = 4;
        expandtab = true ;

        hlsearch = false;
        incsearch = true;
        undofile = true;


        termguicolors = true;

        scrolloff = 8;
        signcolumn = "yes";

        updatetime = 50;

        colorcolumn = "120";

        clipboard = {
            providers = {
                wl-copy.enable = true; # Wayland 
            };
            register = "unnamedplus";
        };

    };
}
