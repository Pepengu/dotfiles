{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      markdown
      nix
      toml
      vim
      vimdoc
      rust
      latex
      cpp
      javascript
      typescript
      css
    ];

    settings = {
      auto_install = false;

#     ensure_installed = "all";

      highlight.enable = true;
    };

    nixvimInjections = true;
  };
}
