{pkgs, lib, ...}: {
    stylix = {
        enable = true;

        autoEnable = false;
        targets = {
            ghostty.enable = false;
            rofi.enable = false;
            neovim.enable = false;
        };

        image = ./../backgrounds/background.jpg;
        base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        polarity = lib.mkDefault "dark";
        cursor = {
            package = pkgs.bibata-cursors;
            name = lib.mkDefault "Bibata-Modern-Classic";
            size = 16;
        };

        fonts = {
            serif = {
                package = pkgs.inter;
                name = "Inter";
            };

            sansSerif = {
                package = pkgs.inter;
                name = "Inter";
            };

            monospace = {
                package = pkgs.monaspace;
                name = "Monaspace Argon";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };

            sizes = {
                terminal = 14;
            };
        };
    };
                  }
