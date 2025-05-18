{pkgs, ...}: {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
        nodejs
        docker-compose 

        home-manager
    ];
}
