{pkgs, ...}: {
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        hplip
        cups-filters
        cups-browsed
        #canon-cups-ufr2
      ];
    };
    ipp-usb.enable = true;
  };

  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };
}
