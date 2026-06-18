{pkgs, ...}: {
    fonts = {
        enableDefaultPackages = true;
        enableGhostscriptFonts = true;

        packages = with pkgs; [terminus_font inter ubuntu-classic font-awesome];

        fontconfig = {
            enable = true;
            defaultFonts = {
                serif = ["Ubuntu"];
                sansSerif = ["Ubuntu"];
                monospace = ["DejaVu Sans Mono"];
                emoji = ["FontAwesome"];
            };
        };
    };
}
