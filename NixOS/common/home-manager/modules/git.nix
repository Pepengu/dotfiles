{pkgs, ...}: {
    home.packages = with pkgs; [ git-credential-oauth ];

    programs.git = {
        enable = true;


        settings = {
          user = {
            name = "Pepengu";
            email = "plotnikovanton@gmail.com";
          };

          core = {
            sshCommand = "ssh -i ~/.ssh/id_ed25519";
            editor = "nvim";
          };
          color.ui = true;
          credential.helper = "${pkgs.git-credential-oauth}/bin/git-credential-oauth";
        };
    };
}
