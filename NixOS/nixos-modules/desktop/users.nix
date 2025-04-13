{pkgs, ...}: {

  security.sudo.wheelNeedsPassword = false;
  nix.settings.trusted-users = ["root" "@wheel"];

    users.users.daniil = {
        isNormalUser = true;
        description = "Daniil";
#        home = ~/home/daniil;
#        shell = pkgs.fish;
        extraGroups = [ "networkmanager" "wheel" "docker"];
    };
}
