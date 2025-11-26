_: {
  imports = [
    ./languages

    ./undotree.nix
    ./lsp.nix
    ./cmp.nix
    ./dap.nix
    ./harpoon.nix
    ./treesitter.nix
    ./competitest.nix
  ];

  plugins = {
    lualine.enable = true;
    markdown-preview.enable = true;
    telescope.enable = true;
    web-devicons.enable = true;
  };

  colorschemes = {
    tokyonight = {
      enable = true;
    };

    catppuccin = {
      enable = false;

      settings = {
        flavour = "mocha";
      };
    };
  };
}
