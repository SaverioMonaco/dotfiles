{ config, lib, pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"] ;} );
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "custom/nix" "hyprland/workspaces" "custom/cava-internal"];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "backlight" "pulseaudio" "bluetooth" "network" "battery" ];

        "custom/nix" = {
          "format" = "   ";
          "tooltip" = false;
          "on-click" = "sh ~/dotfiles/rofi/config/bin/powermenu";
        };
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "all-outputs" = true;
          "format-icons" = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六"; 
            "7" = "七"; 
            "8" = "八"; 
            "9" = "九"; 
            "10" = "十";
          };
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };

        "clock" = {
          "format" = "<span color='#b4befe'> </span>{:%H:%M}";
          "tooltip" = true;
          "tooltip-format" = "{:%Y-%m-%d %a}";
          "on-click-middle" = "exec default_wallpaper";
          "on-click-right" = "exec wallpaper_random";
        };

        "cpu" = { "format" = "<span color='#b4befe'> </span>{usage}%"; };
        "memory" = {
          "interval" = 1;
          "format" = "<span color='#b4befe'> </span>{used:0.1f}G/{total:0.1f}G";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "<span color='#b4befe'>{icon}</span> {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };
        "pulseaudio"= {
          "format" = "<span color='#b4befe'>{icon}</span> {volume}%";
          "format-muted" = "";
          "tooltip" = false;
          "format-icons" = {
            "headphone" = "";
            "default" = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
        };
        "bluetooth" = {
          "format" = "<span color='#b4befe'></span> {status}";
          "format-disabled" = "";
          "format-connected" = "<span color='#b4befe'></span> {num_connections}";
          "tooltip-format" = "{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}   {device_address}";
        };
        "network" = {
          "interface" = "wlp3s0";
          "format" = "{ifname}";
          "format-wifi" = "<span color='#b4befe'> </span>{essid}";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "format-disconnected" = "<span color='#b4befe'>󰖪 </span>No Network";
          "tooltip" = false;
        };
        "battery" = {
          "format" = "<span color='#b4befe'>{icon}</span> {capacity}%";
          "format-icons" =  ["" "" "" "" "" "" "" "" "" ""];
          "format-charging" = "<span color='#b4befe'></span> {capacity}%";
          "tooltip" = false;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 16px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 45px;
      }

      window#waybar {
        background: transparent;
      }

      #custom-nix, 
      #workspaces {
        border-radius: 10px;
        background-color: #11111b;
        color: #b4befe;
        margin-top: 15px;
        margin-right: 15px;
        padding-top: 1px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #custom-nix {
        font-size: 20px;
        margin-left: 15px;
        color: #b4befe;
      }

      #custom-cava-internal {
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 1px;
        font-family: "Hack Nerd Font";
        color: #b4befe;
        background-color: #11111b;
        margin-top: 15px;
        border-radius: 10px;
      }

      #workspaces button.active {
        background: #11111b;
        color: #b4befe;
      }

      #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #cpu, #memory{
        border-radius: 10px;
        background-color: #11111b;
        color: #cdd6f4;
        margin-top: 15px;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }

      #backlight, #bluetooth {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 5px;
        margin-right: 0
      }

      #pulseaudio, #network {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 5px;
      }

      #clock {
        margin-right: 0;
      }
  '';
  };
}
