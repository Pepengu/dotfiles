{lib, ...}: {
    config.systemd.user.services = {
        hyprpaper.Unit.After = lib.mkForce ["graphical-session.target"];
        network-manager-applet.Unit.After = lib.mkForce ["graphical-session.target"];
        blueman-applet.Unit.After = lib.mkForce ["graphical-session.target"];
    };
}
