_: {
  programs.ghostty = {
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
}
