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

    pay-respects.enable = true;

    fish = {
      enable = true;
      functions = {
        develop = "nix develop --command fish";
      session = ''
  set -l cmd fzf
  if set -q TMUX
      set cmd "fzf-tmux -p 80%,60% --"
  end
  set -l selection (sesh l | eval $cmd | string trim)
  if test -z "$selection"
      return
  end
  if test -f "$HOME/.config/tmuxinator/$selection.yml"
      tmuxinator start "$selection"
      if set -q TMUX
          tmux switch-client -t "$selection" 2>/dev/null
      end
      return
  end
  if tmux has-session -t "$selection" 2>/dev/null
      if set -q TMUX
          tmux switch-client -t "$selection"
      else
          tmux attach-session -t "$selection"
      end
  else
      set -l session_name (basename "$selection")
      tmux new-session -d -s "$session_name" -c "$selection"
      if set -q TMUX
          tmux switch-client -t "$session_name"
      else
          tmux attach-session -t "$session_name"
      end
  end
'';
      };
    };

    tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 0;
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
