{inputs, pkgs, ...}: 
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  programs.zed-editor = {
    enable = true;
    package = unstable.zed-editor;

    # This populates the userSettings "auto_install_extensions"
    extensions = [ "nix" "toml" "make" "tokyo-night" ];

    # Everything inside of these brackets are Zed options
    userSettings = {
      assistant = {
        enabled = false;
      };

      hour_format = "hour24";
      auto_update = false;

      terminal = {
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [ ".env" "env" ".venv" "venv" ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "ghostty";
        };
        font_family = "FiraCode Nerd Font";
        font_features = null;
        font_size = null;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = {
           program = "fish";
        };
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        clangd = {
          binary = {
            path = "${pkgs.clang-tools}/bin/clangd";
            arguments = [
              "--background-index"
              "--clang-tidy"
              "--header-insertion=never"
            ];
          };
        };
      };

      languages = {
      };

      #vim_mode = true;

      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Tokyo Night Moon";
      };

      show_whitespaces = "all";
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
