{pkgs, ...}: {
  security = {
    polkit = {
      enable = true;
      # Allow wheel group members to perform privileged operations
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (subject.isInGroup("wheel")) {
            return polkit.Result.YES;
          }
        });
      '';
    };

    sudo = {
      enable = true;
      wheelNeedsPassword = false;
      extraRules = [
        {
          groups = [ "wheel" ];
          commands = [
            {
              command = "ALL";
              options = [ "NOPASSWD" "SETENV" ];
            }
          ];
        }
      ];
    };
  };

  # Additional polkit rules for specific system operations
  environment.etc."polkit-1/rules.d/50-nixos.rules" = {
    text = ''
      polkit.addAdminRule(function(action, subject) {
        return ["unix-group:wheel"];
      });

      // Allow wheel group members to run privileged operations
      polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });

      // Allow network management for wheel group
      polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.network1.reload" ||
             action.id == "org.freedesktop.network1.reconfigure" ||
             action.id == "org.freedesktop.resolve1.reload" ||
             action.id == "org.freedesktop.resolve1.reconfigure") &&
            subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });

      // Allow systemd operations for wheel group
      polkit.addRule(function(action, subject) {
        if ((action.id.indexOf("org.freedesktop.systemd1.") == 0) &&
            subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });

      // Allow package management operations
      polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.packagekit.package-install" ||
             action.id == "org.freedesktop.packagekit.package-remove" ||
             action.id == "org.freedesktop.packagekit.system-update") &&
            subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
    mode = "0644";
  };
}
