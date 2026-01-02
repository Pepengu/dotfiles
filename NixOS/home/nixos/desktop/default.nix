{pkgs, ...}: {
  imports = [
    #./users.nix
    ./steam.nix
  ];

  services = {
    logind.lidSwitch = "suspend-then-hibernate";
    upower.enable = true;
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    lldb
  ];

  environment.variables = rec {
    DISPLAY = "0";
  };
}
