{
  pkgs,
  config,
  lib,
  ...
}:
{
  # --- Idle and Lock ---
  services.hypridle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "niri msg action power-on-monitors";
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "brightnessctl -s && brightnessctl set 1%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 600;
          on-timeout = "loginctl lock-session && niri msg action power-off-monitors";
          on-resume = "niri msg action power-on-monitors";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      animations = {
        enabled = true;
      };
      background = lib.mkForce [
        {
          path = "${config.stylix.image}";
          color = "rgb(${config.lib.stylix.colors.base00})";
          blur_passes = 2;
          blur_size = 7;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
        }
      ];
      input-field = lib.mkForce [
        {
          size = "150, 50";
          outline_thickness = 3;
          dots_size = 0.25;
          dots_spacing = 0.75;
          dots_rounding = 0;
          outer_color = "rgb(${config.lib.stylix.colors.base03})";
          inner_color = "rgb(${config.lib.stylix.colors.base00})";
          font_color = "rgb(${config.lib.stylix.colors.base05})";
          check_color = "rgb(${config.lib.stylix.colors.base0A})";
          fail_color = "rgb(${config.lib.stylix.colors.base08})";
          font_family = "${config.stylix.fonts.monospace.name}";
          fade_on_empty = false;
          placeholder_text = "ENTER PIN";
          rounding = 0;
          fail_text = "FAILED";
          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
      ];
    };
  };
}
