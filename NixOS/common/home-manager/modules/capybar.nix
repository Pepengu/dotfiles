{inputs, ...}: {
    programs.capybar = {
        #enable = true;
    };

    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
    };
}
