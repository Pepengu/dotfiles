_: {
    plugins.competitest = {
        enable = true;

        settings = {
            save_current_file = true;

            received_problems_path = "$(HOME)/Documents/CompProg/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)";

            received_contests_directory = "$(HOME)/Documents/CompProg/$(JUDGE)/$(CONTEST)/";
            received_contests_problems_path = "$(PROBLEM).$(FEXT)";

            template_file = "$(HOME)/Documents/CompProg/templates/template.$(FEXT)";
            evaluate_template_modifiers = true;
            compile_command = {
                cpp = {
                    exec = "g++";
                    args = [
                        "-DLOCAL"
                        "$(FNAME)"
                        "-o"
                        "$(FNOEXT)"
                        "-Wall"
                        "-Wextra"
                    ];
                };
            };
        };
    };

    keymaps = [
        { mode = "n"; key = "<leader>r"; action = "<cmd>CompetiTest run<cr>"; }
        { mode = "n"; key = "<leader>o"; action = "<cmd>CompetiTest show_ui<CR>"; }
    ];
}
