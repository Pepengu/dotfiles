{ config, pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };

  ollama = unstable.ollama;

  baseModel = "qwen2.5-coder:7b";
  derivedModel = "qwen2.5-coder:7b-32k";
  numCtx = 32768;

  codexPkg = pkgs.codex;

  modelfilePath = "${config.home.homeDirectory}/.config/ollama/Modelfile.codex-ctx";

  codexOllama = pkgs.writeShellApplication {
    name = "codex-ollama";
    runtimeInputs = [ codexPkg ];
    text = ''exec codex --oss -m ${derivedModel} "$@"'';
  };

  ollamaInit = pkgs.writeShellApplication {
    name = "ollama-init-codex-model";
    runtimeInputs = [ ollama pkgs.curl pkgs.coreutils ];
    text = ''
      set -euo pipefail
      export OLLAMA_HOST=127.0.0.1:11434

      for _ in $(seq 1 60); do
        if curl -sf http://127.0.0.1:11434/api/version >/dev/null; then
          break
        fi
        sleep 1
      done

      # ensure base model exists
      ollama pull "${baseModel}"

      # create derived model with bigger context if missing
      if ! ollama show "${derivedModel}" >/dev/null 2>&1; then
        ollama create "${derivedModel}" -f "${modelfilePath}"
      fi
    '';
  };
in
{
  home.packages = [
    ollama
    pkgs.git
    pkgs.curl
    codexPkg
    codexOllama
  ];

  systemd.user.startServices = "sd-switch";

  systemd.user.services.ollama = {
    Unit = {
      Description = "Ollama (user service)";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = "${ollama}/bin/ollama serve";
      Restart = "always";
      RestartSec = 3;
      Environment = [
        "OLLAMA_HOST=127.0.0.1:11434"
      ];
    };

    Install = { WantedBy = [ "default.target" ]; };
  };

  # Modelfile that sets the actual context for the Ollama model
  home.file.".config/ollama/Modelfile.codex-ctx".text = ''
    FROM ${baseModel}
    PARAMETER num_ctx ${toString numCtx}
  '';

  # One-shot initializer to create qwen2.5-coder:7b-32k automatically
  systemd.user.services.ollama-init-codex-model = {
    Unit = {
      Description = "Initialize Ollama model for Codex (Qwen2.5 Coder 7B + num_ctx)";
      After = [ "ollama.service" ];
      Requires = [ "ollama.service" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${ollamaInit}/bin/ollama-init-codex-model";
    };

    Install = { WantedBy = [ "default.target" ]; };
  };

  home.file.".codex/config.toml".text = ''
    oss_provider = "ollama"
    model_context_window = ${toString numCtx}
  '';
}
