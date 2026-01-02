{lib, pkgs, ...}: {
  config.systemd.user.services = {
    hyprpaper.Unit.After = lib.mkForce ["graphical-session.target"];
    network-manager-applet.Unit.After = lib.mkForce ["graphical-session.target"];
    blueman-applet.Unit.After = lib.mkForce ["graphical-session.target"];
    ollama = {
      Unit = {
        Description = "Ollama Service";
        After = [ "network.target" ];
      };

      Service = {
        ExecStart = "${pkgs.ollama}/bin/ollama serve";
        Restart = "always";

        MemoryMax = "0";

        Environment = "OLLAMA_HOST=127.0.0.1:11434"; 

      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
