{
  lib,
  pkgs,
  config,
  osConfig,
  batteryScript,
  ...
}:

let
  isLaptop = osConfig.networking.hostName == "T480";
in
{
  mainBar = {
    reload_style_on_change = true;
    layer = "top";
    position = "top";
    height = 30;
    spacing = 0;
    margin-top = 2;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;

    modules-left = [
      "idle_inhibitor"
      "niri/workspaces"
      "privacy"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "group/tray-expander"
      "cpu"
      "memory"
      "bluetooth"
      "network"
      "wireplumber"
      "backlight"
    ]
    ++ (lib.optionals isLaptop [ "custom/battery" ]);

    # --- Left ---
    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = "󰅶";
        deactivated = "󰾪";
      };
      tooltip-format-activated = "Idle Inhibitor: Active";
      tooltip-format-deactivate = "Idle Inhibitor: Deactive";
    };

    "niri/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        urgent = "";
      };
    };

    "privacy" = {
      icon-spacing = 20;
      icon-size = 10;
      transition-duration = 250;
      modules = [
        {
          type = "screenshare";
          tooltip = true;
          tooltip-icon-size = 18;
        }
        {
          type = "audio-in";
          tooltip = true;
          tooltip-icon-size = 18;
        }
        {
          type = "audio-out";
          tooltip = true;
          tooltip-icon-size = 18;
        }
      ];
    };

    # --- Center ---
    "clock" = {
      format = "{:L%A %H:%M}";
      format-alt = "{:L%d %B W%V %Y}";
      tooltip-format = "<tt>{calendar}</tt>}";
      calendar = {
        mode = "month";
        mode-mon-col = 3;
        weeks-pos = "left";
        on-scroll = 1;
        on-click-right = "mode";
        format = {
          today = "<b><u>{}</u></b>";
        };
      };
      actions = {
        on-click-right = "mode";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };

    # --- Right ---
    "cpu" = {
      interval = 5;
      format = "󰍛";
      tooltip-format = "CPU: {usage}%";
      on-click = "kitty --app-id kitty-float -e btop";
    };

    "memory" = {
      interval = 5;
      format = "󰘚";
      tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G ({percentage}%)";
      on-click = "kitty --app-id kitty-float -e btop";
    };

    "network" = {
      format = "{icon}";
      format-icons = [
        "󰤯"
        "󰤟"
        "󰤢"
        "󰤥"
        "󰤨"
      ];
      format-wifi = "{icon}";
      format-ethernet = "󰀂";
      format-disconnected = "󰤮";
      tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
      tooltip-format-ethernet = "Wired\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
      tooltip-format-disconnected = "Disconnected";
      interval = 3;
      on-click = "networkmanager_dmenu";
    };

    "bluetooth" = {
      format = "";
      format-disabled = "󰂲";
      format-connected = "";
      tooltip-format = "Bluetooth: {num_connections} connected";
      on-click = "blueman-manager";
    };

    "wireplumber" = {
      format = "{icon}";
      format-muted = "";
      format-icons = {
        default = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };
      tooltip-format = "Volume: {volume}%";
      scroll-step = 5;
      on-click = "kitty --app-id kitty-float wiremix";
      on-click-right = "pamixer -t";
    };

    "backlight" = {
      format = "{icon}";
      format-icons = [
        "󰃞"
        "󰃟"
        "󰃠"
      ];
      scroll-step = 5;
    };

    "custom/battery" = {
      exec = batteryScript;
      return-type = "json";
      format = "{}";
      interval = 10;
    };
    # --- Custom Auto-Expand Tray ---
    "group/tray-expander" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 600;
        children-class = "tray-group-item";
      };
      modules = [
        "custom/expand-icon"
        "tray"
      ];
    };

    "custom/expand-icon" = {
      format = "󰇙";
      tooltip = false;
    };

    "tray" = {
      icon-size = 12;
      spacing = 30;
    };
  };
}
