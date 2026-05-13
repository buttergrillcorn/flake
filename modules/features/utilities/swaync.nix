{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.swaync = {

    enable = true;

    settings = {
      widgets = [
        "dnd"
        "buttons-grid"
        "mpris"
        "volume"
        "title"
        "inhibitors"
        "notification"
      ];
      widget-config = {
        buttons-grid = {
          buttons-per-row = 4;
          actions = [
            {
              label = "󰌾";
              command = "loginctl lock-session";
            }
            {
              label = "󰗽";
              command = "niri msg action quit";
            }
            {
              label = "󰜉";
              command = "reboot";
            }
            {
              label = "󰐥";
              command = "shutdown now";
            }
          ];
        };
      };
    };

    style = ''
      * {
        border-radius: 0px;
      }
    '';
  };
}
