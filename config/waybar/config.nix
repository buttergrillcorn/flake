{ inputs, lib, config, pkgs, ...}:

{
  programs.waybar.settings =
    {
      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        spacing = 0;
        margin-top = 5;
        margin-left = 8;
        margin-right = 8;
        modules-left = [
            "hyprland/submap"
            "idle_inhibitor"
            "hyprland/workspaces"
        ];
        modules-center = [
            "hyprland/window"
        ];
        modules-right = [
            "tray"
            "privacy"
            "pulseaudio"
            "pulseaudio/slider"
            "battery"
            "clock"
        ];

        "hyprland/submap" = {
            format = "{}";
        };
        "hyprland/window" = {
            format = "{title}";
        };
        "hyprland/workspaces" = {
            format = "{id}";
            persistent-workspaces = {
                "*" = 9;
            };
        };
        "wlr/taskbar" = {
            format = "{icon}";
        };
        "clock" = {
            format = "{:%Y-%m-%d | %H:%M:%S}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
                mode = "year";
                mode-mon-col = 3;
                weeks-pos = "right";
                on-scroll = 1;
                on-click-right = "mode";
                format = {
                    months = "<span color='#ffead3'><b>{}</b></span>";
                    days = "<span color='#ecc6d9'><b>{}</b></span>";
                    weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                    weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                    today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            actions = {
                on-click-right = "mode";
                on-click-forward = "tz_up";
                on-click-backward = "tz_down";
                on-scroll-up = "shift_up";
                on-scroll-down = "shift_down";
            };
        };
        "pulseaudio" = {
            format = "VOLUME:";
            format-muted = "MUTED:";
            format-bluetooth = "BLUETOOTH:";
            on-click = "pavucontrol";
        };
        "tray" = {
            icon-size = 18;
            spacing = 15;
        };
        "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
                activated = "󰈈";
                deactivated = "󰈉";
            };
        };
        "battery" = {
            format = "BATTERY: {capacity}%";
        };
      };
    };
}
