{pkgs, ...}:{
  extraPackages = with pkgs;
  [
    lldb
    rust-analyzer
  ];

  globals.rustfmt_autosave = true;

  plugins = {
    cmp.filetype.rust = {
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

    lsp.servers.rust_analyzer = {
      enable = true;
      installRustc = true;
      installCargo = true;

      settings = {
        cargo = {
          features = "all";
        };
      };
    };
  };

  extraConfigLua = ''
    local dap = require('dap')

    -- LLDB adapter
    dap.adapters.lldb = {
      type = 'executable',
      command = '${pkgs.lldb}/bin/lldb-dap',
      name = 'lldb'
    }

  -- Rust configurations
    dap.configurations.rust = {
      {
        name = 'Debug (cargo build first)',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
          end,
        cwd = vim.fn.getcwd(),
        stopOnEntry = false,
        args = {},
      },
    }
  '';

  keymaps = [
    { mode = "n"; key = "<F5>";  action = ''<cmd>lua require("dap").continue()<CR>''; }
    { mode = "n"; key = "<F10>"; action = ''<cmd>lua require("dap").step_over()<CR>''; }
    { mode = "n"; key = "<F11>"; action = ''<cmd>lua require("dap").step_into()<CR>''; }
    { mode = "n"; key = "<F12>"; action = ''<cmd>lua require("dap").step_out()<CR>''; }
    { mode = "n"; key = "<leader>b";  action = ''<cmd>lua require("dap").toggle_breakpoint()<CR>''; }
    { mode = "n"; key = "<leader>du"; action = ''<cmd>lua require("dapui").toggle()<CR>''; }
  ];
}
