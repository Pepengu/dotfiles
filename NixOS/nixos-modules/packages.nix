{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        nodejs

        home-manager
    ];
}
