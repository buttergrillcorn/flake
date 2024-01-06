{ inputs, lib, config, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    extraConfig = ''

      # Display & Devices
      monitor = , highres, auto, 1
      monitor = HDMI-A-1, 2560x1440@144, 0x0, 1
      input {
        kb_layout = us
        follow_mouse = 1
        accel_profile = flat
      }

      # General
      general {
        gaps_in = 5
        gaps_out = 7
        border_size = 1
        col.active_border = 0xFFdfdfdf
        col.inactive_border = 0xFF606060
        layout = dwindle
        resize_on_border = true
      }

      # Decoration
      decoration {
        rounding = 0
        active_opacity = 0.95
        inactive_opacity = 0.95
        fullscreen_opacity = 1
        drop_shadow = yes
        shadow_range = 3
        shadow_render_power = 5
        col.shadow = 0xffffffff
        shadow_ignore_window = true
        dim_inactive = true
        dim_strength = 0.1
        blur {
          enabled = yes
        }
      }

      # Layouts
      dwindle {
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }
      master {
          new_is_master = true
      }

      # Misc
      misc {
           disable_hyprland_logo = true
      }

      # Autostart
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = sleep 2 && noisetorch -i -o &
      exec-once = waybar &
      exec-once = sleep 2 && swww init &
      exec-once = swww img ~/Pictures/monochrome-building.jpeg &
      exec-once = nm-applet --indicator &
      exec-once = blueman-applet &
      exec-once = fcitx5 &
      exec-once = kdeconnect-indicator &
      exec-once = udiskie --automount --notify &
      exec-once = sleep 2 && syncthingtray  --wait &
      exec-once = /usr/lib/polkit-kde-authentication-agent-1
      exec-once = /usr/lib/xdg-desktop-portal-hyprland &
      exec-once = sleep 2
      exec-once = /usr/lib/xdg-desktop-portal &
      exec-once = wl-paste -t text --watch clipman store
      exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
      exec-once = swayidle -w timeout 1800 '${pkgs.swaylock} -f -c 202020 --indicator-idle-visible' timeout 2700 'swaymsg "output * power off"' resume '${pkgs.hyprland}/bin/hyprctl dispatch dpms on' before-sleep '${pkgs.swaylock} -f -c 202020 --indicator-idle-visible'

      # Environment Variables
      env = GDK_SCALE,1.5
      env = XCURSOR_SIZE,24

      # Keybinds
      # MODS #
      $mainMod    = SUPER
      $term       = kitty
      $file       = nemo
      $browser    = firefox
      $color      = hyprpicker -a
      $run        = fuzzel
      $editor     = emacsclient -c -a ""
      $tomato     = gnome-pomodoro
      $process    = kitty gotop
      $noti       = dunstctl history-pop

      # MAIN #
      bind = $mainMod,            RETURN,   exec,   $term
      bind = $mainMod_SHIFT,      RETURN,   exec,   [float;size 45% 40%;center] $term
      bind = $mainMod,            E,        exec,   $file
      bind = $mainMod_SHIFT,      E,        exec,   [float;size 45% 40%;center] $file
      bind = $mainMod,            D,        exec,   $run
      bind = $mainMod,            B,        exec,   [tile]$browser
      bind = $mainMod,            N,        exec,   $editor
      bind = $mainMod_SHIFT,      N,        exec,   [float;size 45% 40%;center] $editor
      bind = $mainMod,            T,        exec,   $tomato
      bind = $mainMod_SHIFT,      T,        exec,   $todo
      bind = $mainMod,            C,        exec,   $color
      bind = $mainMod,            M,        exec,   [float; size 45% 45%;center] $process
      bind = $mainMod_SHIFT_CTRL, B,        exec,   killall -SIGUSR2 waybar     #reload waybar
      bind = $mainMod_SHIFT_CTRL, N,        exec,   $noti

      bind = $mainMod,            F,        togglefloating,
      bind = $mainMod_SHIFT,      F,        fullscreen,
      bind = $mainMod,            Q,        killactive,
      bind = $mainMod_CTRL_SHIFT, Q,        exit,
      bind = $mainMod,            P,        pseudo, # dwindle
      bind = $mainMod_SHIFT,      P,        togglesplit, # dwindle
      bind = $mainMod,            g,        togglegroup,
      bind = $mainMod_SHIFT,      g,        moveoutofgroup,
      bind = $mainMod,            tab,      changegroupactive,

      bind = $mainMod_SHIFT,      L,        exec,               swaylock -f -c 202020 --indicator-idle-visible
      bind = $mainMod_CTRL_SHIFT, L,        exec,               hyprctl dispatch exit

      # HYPRLOAD #
      # bind = $mainMod_CTRL_SHIFT, -, hyprload, load
      # bind = $mainMod_CTRL_SHIFT, =, hyprload, reload

      # NAVIGATION #
      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Move focus with mainMod + hjkl
      bind = $mainMod, h, movefocus, l
      bind = $mainMod, l, movefocus, r
      bind = $mainMod, k, movefocus, u
      bind = $mainMod, j, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace silently with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

      # Move active window to a workspace with mainMod + CTRL + [0-9]
      bind = $mainMod CTRL, 1, movetoworkspace, 1
      bind = $mainMod CTRL, 2, movetoworkspace, 2
      bind = $mainMod CTRL, 3, movetoworkspace, 3
      bind = $mainMod CTRL, 4, movetoworkspace, 4
      bind = $mainMod CTRL, 5, movetoworkspace, 5
      bind = $mainMod CTRL, 6, movetoworkspace, 6
      bind = $mainMod CTRL, 7, movetoworkspace, 7
      bind = $mainMod CTRL, 8, movetoworkspace, 8
      bind = $mainMod CTRL, 9, movetoworkspace, 9
      bind = $mainMod CTRL, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Scratchboard
      bind = $mainMod, W, togglespecialworkspace,
      bind = $mainMod_SHIFT, W, movetoworkspacesilent, special

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bindm = $mainMod SHIFT, mouse:272, resizewindow

      # MEDIA KEYS #
      # binde = ,XF86MonBrightnessUp,   exec, light -A 5
      # binde = ,XF86MonBrightnessDown, exec, light -U 5
      # binde = ,XF86AudioRaiseVolume,  exec, pamixer -i 5
      # binde = ,XF86AudioLowerVolume,  exec, pamixer -d 5
      # bind = ,XF86AudioMute,          exec, pamixer -t
      # bind = ,XF86AudioMicMute,       exec, pamixer --default-source -t

      # SCREENSHOT
      bind = $mainMod_SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -
      bind = , print, exec, grim -o HDMI-A-1 - | swappy -f -

      # LAPTOP #
      bindl = ,switch:Lid Switch, exec, swaylock -C ~/.config/swaylock/config
      bindl = ,switch:on:Lid Switch, exec, systemctl suspend

    '';
  };
}
