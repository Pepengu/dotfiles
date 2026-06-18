{ pkgs, inputs, ... }: {
/*   imports = [
    inputs.dank-material-shell.nixosModules.greeter
  ];

  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "hyprland";
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    configHome = "/home/daniil";
  };

  services.greetd.settings = {
    default_session.user = "daniil";
  };*/

  programs.regreet = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    settings = {
      default_session = {
        user = "daniil";
      };
    };
  };

  services.displayManager.sessionPackages = [
    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
  ];
}
