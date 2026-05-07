{
  pkgs,
  config,
  lib,
  ...
}:
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
          on-timout = "brightnessctl -s && brightnessctl set 1%";
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
        disable_loading_bar = false;
        grace = 0;
      };
      animations = {
        enabled = true;
      };
      input-field = lib.mkForce [
        {
          monitor = "";
          size = "150, 50";
          outline_thickness = 3;
          dots_size = 0.25;
          dots_spacing = 0.75;
          dots_rounding = 0;
          outer_color = config.lib.stylix.colors.withHashtag.base03;
          inner_color = config.lib.stylix.colors.withHashtag.base00;
          font_color = config.lib.stylix.colors.withHashtag.base05;
          check_color = config.lib.stylix.colors.withHashtag.base0A;
          fail_color = config.lib.stylix.colors.withHashtag.base08;
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
