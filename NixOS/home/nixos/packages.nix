{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    home-manager
    simple-scan
    lxqt.lxqt-policykit
  ];
}
