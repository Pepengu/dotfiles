{pkgs, inputs, ...}: {
  imports = [
    #./users.nix
    ./steam.nix
  ];

  services = {
    logind.settings.Login.HandleLidSwitch = "suspend-then-hibernate";
    upower.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    lldb
  ];
}
