{ ... }: {
  programs.hyprpanel = {
    enable = true;
    settings = {

      layout = {
        bar.layouts = {
          "*" = {
            left = [ "workspaces" ];
            middle = [ "clock" ];
            right = [ "volume" "systray" "notifications" ];
          };
        };
      };
    };
  };
}
