{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
    extraConfig = ''
      include /home/cris/.cache/wal/colors-sway
    '';
    config = rec {
      startup = [
#         { command = "waybar"; }
      ];
      output = {
        "*" = {
	  bg = "/home/cris/wallpapers/sunflower.jpg fill";
	};
      };
      window = {
        border = 3;
	titlebar = false;
      };
      floating = {
        border = 3;
	titlebar = false;
      };
      gaps = {
        inner = 5;
	outer = 5;
      };
      colors = {
        focused = {
	  border = "#A15D11";
	  background = "#141008";
	  childBorder = "#A15D11";
	  indicator = "#C97604";
	  text = "#c4c3c1";
	};
	focusedInactive = {
	  border = "#8F4E0B";
	  background = "#141008";
	  childBorder = "#8F4E0B";
	  indicator = "#C97604";
	  text = "#c4c3c1";
	};
      	unfocused = {
      	  border = "#88410D";
      	  background = "#141008";
      	  childBorder = "#88410D";
	  indicator = "#C97604";
      	  text = "#c4c3c1";
      	};
      };
      bars = [{ command = "swaybar_command waybar"; }];
      modifier = "Mod4";
      terminal = "foot";
      menu = "wmenu-run";
      input."*".xkb_layout = "latam";
      keybindings = lib.mkOptionDefault {
        "${modifier}+t" = "exec ${terminal}";
        "${modifier}+w" = "kill";
        "${modifier}+q" = "exec ${menu}";
	"${modifier}+Shift+q" = "exit";	
	# Custom volume keys #
	"XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
	"XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
	"XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
	"XF86MonBrightnessUp" = "exec brightnessctl s 5%+";
	"XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
      };
    };
    checkConfig = false;
  };
}
