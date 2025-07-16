_: {
    imports = [
       ./sddm

       ./hyprland.nix
       ./boot.nix
       ./networking.nix
       ./users.nix
       ./fonts.nix
       ./pipewire.nix
       ./locale.nix
       ./bluetooth.nix
       ./steam.nix
    ];

    services = {
        logind.lidSwitch = "suspend-then-hibernate";
        upower.enable=true;
    };

}
