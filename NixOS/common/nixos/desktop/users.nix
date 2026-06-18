{pkgs, ...}: {
  programs.fish.enable = true;

  users.users.daniil = {
    isNormalUser = true;
    description = "Daniil";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" "video" "render"];
  };
}
