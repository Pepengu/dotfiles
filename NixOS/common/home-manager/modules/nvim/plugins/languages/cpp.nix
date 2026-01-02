_: {
   plugins = {
       cmp.filetype.cpp = {
           sources = [
               { name = "git"; }
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

       lsp = {
           servers = {
               clangd = {
                   enable = true;
               };
           };
       };
   };
}
