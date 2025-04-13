{
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    opts.langmap =
        "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz";

    keymaps = [
    {
        mode = "n"; 
        key = "<leader>pv";
        action = "<cmd>Ex<cr>";
    }
    {
        mode = "n";
        key = "<leader>y";
        action = "\"+y";
    }
    {
        mode = "v";
        key = "<leader>y";
        action = "\"+y";
    }
    {
        mode = "n";
        key = "<leader>p";
        action = "\"+p";
    }
    {
        mode = "v";
        key = "<leader>p";
        action = "\"+p";
    }
    ];
}
