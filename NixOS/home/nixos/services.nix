{pkgs, inputs, ...}: 
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  services = {
    v2raya = {
      enable = true;
      package = unstable.v2raya;
    };
    gvfs.enable = true;
  };
}
