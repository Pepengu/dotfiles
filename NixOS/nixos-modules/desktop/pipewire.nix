_: {
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = false;

        pulse.enable = true;
    };

    nixpkgs.config.pulseaudio = true;
    hardware.pulseaudio.enable = false;
}
