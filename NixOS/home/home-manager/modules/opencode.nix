{inputs, pkgs, ...}:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  programs.opencode = {
    package = unstable.opencode;
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      model = "ollama/qwen2.5-coder:7b";
      provider = {
        ollama = {
          name = "Ollama (local)";
          npm = "@ai-sdk/openai-compatible";
          options = {
            baseURL = "http://localhost:11434/v1";
          };
          models = {
          "qwen2.5-coder:7b" = {
            tools = true;
          };
          "llama3.2:3b" = {
            tools = true;
          };
        };
        };
      };
    };
  };
}
