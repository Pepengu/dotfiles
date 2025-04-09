{pkgs, ...}: {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
#        (texlive.combine { inherit (texlive) scheme-full latexmk opensans abntex2; })
        nodejs
        okular
        docker-compose 

        home-manager
    ];
}
