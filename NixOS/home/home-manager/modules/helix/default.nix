{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
        };
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          file-types = ["nix"];
          language-servers = [ "nixd" ];
        }
        {
          name = "typst";
          file-types = ["typ"];
          language-servers = [ "tinymist" ];
          auto-format = true;
          formatter.command = "typstyle";
        }
      ];
    };
  };

  home.packages = with pkgs; [
    nixd
    tinymist
  ];
}
