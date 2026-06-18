{pkgs, ...}: {
  programs = {
    vscode = {
      enable = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        elixir-lsp.vscode-elixir-ls
        saoudrizwan.claude-dev
        rooveterinaryinc.roo-cline
      ];
    };
  };
}
