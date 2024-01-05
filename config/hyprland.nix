{ inputs, lib, config, pkgs, ...}:
{

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''

      # Display & Devices

      monitor = , highres, auto, 1
      inputs {
        kb_layout = us
        follow_mouse = 1
        accel_profile = flat
      }
      gesture {
        workspace_swipe = on
      }
      device:hhkb-hybrid_3-keyboard {
          kb_layout = us
      }

      # General
      general {
        gaps_in = 5
        gaps_out = 7
        border_size = 2
        col.active_border = 0xFFFFFFFF
        col.inactive_border = 0xFF000000
        layout = dwindle
        resize_on_border = true
      }

      # Decoration
      decoration {
        rounding = 0  
        multisample_edge = true
        active_opacity = 0.95
        inactive_opacity = 0.95
        fullscreen_opacity = 1
        drop_shadow = yes
        shadow_range = 10
        shadow_render_power = 10
        col.shadow = 0xFF000000
        shadow_ignore_window = true
        dim_inactive = true
        dim_strength = 0.1
        blur {
          enabled = yes
          new_optimization = true
        }
      }

      # Animation
      animation {
        enabled = yes
      }

    '';
  };
}
