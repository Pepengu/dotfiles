_: {
    plugins.harpoon = {
        enable = true;

#        keymapsSilent = true;
    };

    keymaps = [
        { mode = "n"; key = "<leader>a"; action.__raw = "function() require'harpoon':list():add() end"; }
        { mode = "n"; key = "<C-e>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
    ];
}
