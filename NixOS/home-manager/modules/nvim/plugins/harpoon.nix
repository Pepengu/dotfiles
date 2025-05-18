_: {
    plugins.harpoon = {
        enable = true;

        keymapsSilent = true;

    };

    keymaps = [
        { mode = "n"; key = "<leader>a"; action.__raw = "function() require'harpoon.mark'.add_file() end"; }
        { mode = "n"; key = "<C-e>"; action.__raw = "function() require'harpoon.ui'.toggle_quick_menu() end"; }
    ];
}
