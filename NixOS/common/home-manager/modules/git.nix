{pkgs, ...}: {
    home.packages = with pkgs; [ git-credential-oauth ];

    programs.git = {
        enable = true;

        userName = "Pepengu";
        userEmail = "plotnikovanton@gmail.com";
        extraConfig = {
            core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
            core.editor = "nvim";
            color.ui = true;
            credential.helper = "${pkgs.git-credential-oauth}/bin/git-credential-oauth";
        };
    };
}
