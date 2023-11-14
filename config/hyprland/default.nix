{ config, lib, pkgs, ...}:

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
	    animations {
    	enabled = yes
    	bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    	bezier = easeInOutCubic, 0.65, 0, 0.35, 1
    	bezier = overshot, 0.05, 0.9, 0.1, 1.05
    	bezier = smoothOut, 0.36, 0, 0.66, -0.56
    	bezier = smoothIn, 0.25, 1, 0.5, 1
    	animation = windows, 1, 5, overshot, slide
    	animation = windowsOut, 1, 4, smoothOut, slide
    	animation = windowsMove, 1, 4, default
    	animation = border, 1, 10, default
    	animation = fade, 1, 10, smoothIn
    	animation = fadeDim, 1, 10, smoothIn
    	animation = workspaces, 1, 6, default
    	}

      # Layout
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
    	# animate_manual_resizes = true
    	# animate_mouse_windowdragging = true
    	hide_cursor_on_touch = true
    	vfr = true
    	vrr = 1
    	focus_on_activate = true
    	render_titles_in_groupbar = false
    	groupbar_titles_font_size = 14
    	groupbar_gradients = false
	    }

      # Autostarts
	    exec-once = $HOME/.local/share/hyprload/hyprload.sh
	    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
	    exec-once = sleep 2 && noisetorch -i -o &
	    exec-once = waybar &
	    exec-once = sleep 2 && swww init &
    	exec-once = swww img ~/Pictures/Wallpapers/forest.jpg &
	    exec-once = nm-applet --indicator &
    	exec-once = blueman-applet &
    	exec-once =	fcitx5 &
    	exec-once =	kdeconnect-indicator &
    	exec-once = udiskie --automount --notify &
    	exec-once = sleep 2 && syncthingtray  --wait &
    	exec-once = /usr/lib/polkit-kde-authentication-agent-1
    	exec-once =	wl-paste -t text --watch clipman store
    	# exec-once =	xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

    	# Environment Variables
    	# env = GDK_SCALE,1.5
    	# env = XCURSOR_SIZE,24 
      
      # # KEYBINDS #

# MODS # 

      $mainMod 		= SUPER
      $term			= kitty
      $file			= nemo
      $browser		= firefox
      $color			= hyprpicker -a
      $run			= tofi-drun --drun-launch=true
      $editor			= helix
      $note			= obsidian
      $todo			= sleek
      $tomato			= gnome-pomodoro
      $process		= kitty gotop
      $noti			= dunstctl history-pop

# MAIN #
      bind = $mainMod,            RETURN,   exec,               $term
      bind = $mainMod_SHIFT,      RETURN,   exec,               [float;size 45% 40%;center] $term
      bind = $mainMod,            E,        exec,               $file
      bind = $mainMod_SHIFT,      E,        exec,               [float;size 45% 40%;center] $file
      bind = $mainMod,            D,        exec,               $run
      bind = $mainMod,            B,        exec,               [tile]$browser
      bind = $mainMod,           	N,        exec,               $note
      bind = $mainMod_SHIFT,      N,        exec,               [float;size 45% 40%;center] $editor
      bind = $mainMod,            T,        exec,               $tomato
      bind = $mainMod_SHIFT,      T,        exec,               $todo
      bind = $mainMod,            C,        exec,               $color
      bind = $mainMod,            M,        exec,               [float; size 45% 45%;center] $process
      bind = $mainMod_SHIFT_CTRL, B,        exec,               killall -SIGUSR2 waybar     #reload waybar
      bind = $mainMod_SHIFT_CTRL,	N,		  exec,				  $noti

      bind = $mainMod,            F,        togglefloating, 
           bind = $mainMod_SHIFT,      F,        fullscreen,
           bind = $mainMod,            Q,        killactive, 
           bind = $mainMod_CTRL_SHIFT, Q,        exit,
           bind = $mainMod,            P,        pseudo, # dwindle
             bind = $mainMod_SHIFT,      P,        togglesplit, # dwindle
             bind = $mainMod,            g,        togglegroup,
           bind = $mainMod_SHIFT,      g,        moveoutofgroup,
           bind = $mainMod,            tab,      changegroupactive,

           bind = $mainMod_SHIFT,          L,        exec,               swaylock -f
             bind = $mainMod_CTRL_SHIFT,      L,        exec,               hyprctl dispatch exit

# HYPRLOAD #

# bind = $mainMod_CTRL_SHIFT,	-, hyprload, load
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
# binde = ,XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
# binde = ,XF86AudioLowerVolume,  exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-
# bind = ,XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
# bind = ,XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# WOB #

             $WOBSOCK = $XDG_RUNTIME_DIR/wob.sock
             exec-once = rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob
             exec-once = systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK
             binde = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
             binde = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
             binde = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK
             binde = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK
             binde = ,XF86MonBrightnessUp, exec, light -A 5 && light -G | cut -d'.' -f1 > $WOBSOCK
             binde = ,XF86MonBrightnessDown, exec, light -U 5 && light -G | cut -d'.' -f1 > $WOBSOCK


# SCREENSHOT 

             bind = $mainMod_SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -
             bind = , print, exec, grim -o eDP-1 - | swappy -f -

# LAPTOP #
             bindl = ,switch:Lid Switch, exec, swaylock -C ~/.config/swaylock/config
             bindl = ,switch:on:Lid Switch, exec, systemctl suspend
      
    '';
  }; 

}
