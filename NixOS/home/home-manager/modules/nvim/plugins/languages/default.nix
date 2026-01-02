{pkgs, ...}: {
  imports = [
    ./rust.nix
    ./go.nix
    ./tex.nix
    ./cpp.nix
    ./typst.nix
    ./elixir.nix
  ];

  plugins = {
    lsp = {
      servers = {
        cssls.enable = true;
        ts_ls.enable = true;
        nil_ls.enable = true;
        taplo.enable = true;
      };
    };

    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        markdown
        nix
        toml
        yaml
        vim
        vimdoc
        rust
        latex
        typst
        cpp
        javascript
        typescript
        tsx
        css
        go
        elixir
      ];

      settings = {
        auto_install = false;

#     ensure_installed = "all";

        highlight.enable = true;
      };

      nixvimInjections = true;
    };

  };
}
