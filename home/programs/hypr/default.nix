{ config, inputs, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=eDP-1, 1366x768@60, 0x0, 1

      # Source a file (multi-file configs)
      source = ~/.config/hypr/mocha.conf

      # Execute your favorite apps at launch
      exec-once = swww init
      exec = sleep 0.5 && default_wallpaper

      exec-once = dunst
      exec-once = nm-applet --indicator
      exec = pkill waybar & sleep 0.5 && waybar

      # Some default env vars.
      env = XCURSOR_SIZE,24

      input {
          kb_layout = it
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          gaps_in = 7
          gaps_out = 15
          border_size = 2
          col.active_border = rgb($mauveAlpha) rgb($blueAlpha) 45deg
          col.inactive_border = rgb($baseAlpha)
          resize_on_border = yes
          extend_border_grab_area = 15
          layout = dwindle
      }

      decoration {
          rounding = 10
          blur {
            enabled = true
            size = 3 
            new_optimizations = true
            passes = 1
          }

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = yes

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default, slidevert
      }

      dwindle {
          pseudotile = yes 
          preserve_split = yes 
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = off
      }

      device:epic-mouse-v1 {
          sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrule = float, ^(vimiv)$
      windowrule = opacity 0.9 0.7, ^(kitty)$
      windowrule = opacity 0.95 0.8, ^(obsidian)$

      source=~/.config/hypr/binds.conf
    '';
  };
}
