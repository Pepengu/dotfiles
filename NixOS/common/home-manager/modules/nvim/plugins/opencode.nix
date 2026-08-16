_: {
  plugins = {
    opencode = {
      enable = true;
      settings = {
#        snack.enable = true;
      };
    };
  };

  keymaps = [
    { mode = "n"; key = "<leader>oa"; action.__raw = "function() require('opencode').ask('@this: ') end, { desc = 'Ask OpenCode...' }"; }
    { mode = "n"; key = "<leader>os"; action.__raw = "function() require('opencode').select() end,       { desc = 'Select OpenCode...'}"; }
  ];
}
