{pkgs, ...}: {
  programs = {
    ghostty = {
      enable = true;
      enableFishIntegration = true;
      installVimSyntax = true;

      settings = {
        window-decoration = "none";
        theme = "tokyonight";
        font-size = 16;
        window-save-state = "always";
        gtk-tabs-location = "hidden";
      };
    };

    thefuck.enable = true;

    fish = {
      enable = true;
      functions = {
          develop = "nix develop --command fish";
          session = "sesh cn (sesh l | fzf)";
      };
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      shortcut = "C-a";
      shell = "${pkgs.fish}/bin/fish";
      tmuxinator.enable = true;
      clock24 = true;
      plugins = with pkgs.tmuxPlugins; [
        tokyo-night-tmux
      ];
      extraConfig = ''
        set-option -g status-position top
        set-option -g mouse on
      '';
    };

    zoxide.enable = true;

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    sesh = {
      enable = true;
      enableAlias = true;
    };
  };
}
