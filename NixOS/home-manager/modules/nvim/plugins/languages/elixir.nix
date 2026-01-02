_: {
  plugins = {
    cmp.filetype.elixir = {
      sources = [
      { name = "nvim_lsp"; }
      {
        name = "buffer"; 
        option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        keywordLength = 3;
      }
      {
        name = "path"; 
        keywordLength = 3;
      }
      ];
    };

    lsp.servers.elixirls = {
      enable = true;
    };
  };
}
