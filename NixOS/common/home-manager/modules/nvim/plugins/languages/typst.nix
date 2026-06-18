{pkgs, ...}: {
  plugins = {
    cmp.filetype.typst = {
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

    lsp.servers.tinymist = {
      enable = true;
      settings = {
        formatterMode = "typstyle";
        exportPdf = "onType";
      };
    };
  };
}
