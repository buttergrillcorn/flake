{ pkgs, ... }:
{
  # --- Idle and Lock ---
  home.packages = with pkgs; [
    hypridle
    hyprlock
  ];

  services.hypridle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "niri msg action power-on-monitors";
        ignore_dbus-inhibit = false;
      };
      listener = [
        {
          timeout = 300;
          on-timout = "light -O && light -S 1";
          on-resume = "light -I";
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
        disable_loading_bar = false;
        grace = 0;
      };
      animations = {
        enabled = true;
      };
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "150, 50";
          outline_thickness = 3;
          dots_size = 0.25;
          dots_spacing = 0.75;
          dots_rounding = 0;
          outer_color = "#f2f2f2";
          inner_color = "#f2f2f2";
          font_color = "#282828";
          font_family = "JetBrainsMono Nerd Font";
          fade_on_empty = false;
          placerholder_text = "ENTER PIN";
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
