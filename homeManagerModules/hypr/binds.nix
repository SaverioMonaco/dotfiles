{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    binds = {
      movefocus_cycles_fullscreen = true;
    };

    bind = [
      "$mainMod, Z, exec, foot"
      "$mainMod, B, exec, brave"
      "$mainMod, Q, killactive,"
      "$mainMod, F, fullscreen, 0"
      "$mainMod, Space, togglefloating"
      "$mainMod, E, exec, dolphin"
      "$mainMod, C ,exec, hyprpicker -a"

      # switch focus
      "$mainMod, h, movefocus, l"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"
      "$mainMod, l, movefocus, r"

      # switch workspace
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # same as above, but switch to the workspace
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      # window control
      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, down, movewindow, d"
      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, j, movewindow, d"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, l, movewindow, r"

      "$mainMod CTRL, left, resizeactive, -80 0"
      "$mainMod CTRL, right, resizeactive, 80 0"
      "$mainMod CTRL, up, resizeactive, 0 -80"
      "$mainMod CTRL, down, resizeactive, 0 80"
      "$mainMod CTRL, h, resizeactive, -80 0"
      "$mainMod CTRL, j, resizeactive, 0 80"
      "$mainMod CTRL, k, resizeactive, 0 -80"
      "$mainMod CTRL, l, resizeactive, 80 0"

      "$mainMod ALT, left, moveactive,  -80 0"
      "$mainMod ALT, right, moveactive, 80 0"
      "$mainMod ALT, up, moveactive, 0 -80"
      "$mainMod ALT, down, moveactive, 0 80"
      "$mainMod ALT, h, moveactive,  -80 0"
      "$mainMod ALT, j, moveactive, 0 80"
      "$mainMod ALT, k, moveactive, 0 -80"
      "$mainMod ALT, l, moveactive, 80 0"

      # media and volume controls
      # ",XF86AudioMute,exec, pamixer -t"
      ",XF86AudioPlay,exec, playerctl play-pause"
      ",XF86AudioNext,exec, playerctl next"
      ",XF86AudioPrev,exec, playerctl previous"
      ",XF86AudioStop,exec, playerctl stop"

      "$mainMod, mouse_down, workspace, e-1"
      "$mainMod, mouse_up, workspace, e+1"

    ];

    # mouse binding
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
