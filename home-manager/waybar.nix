{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ../waybar/style.css;
    settings = {
      main = {
        modules-left = ["sway/workspaces" "sway/mode" "sway/scratchpad" ];
        modules-center = ["sway/window"];
        modules-right = ["mpd" "pulseaudio" "network" "battery" "tray" "clock"];
        network = {
	  format = "󰤨  {essid}";
	  format-disconnected = "󰤭  Disconnected";
	};
	mpd = {
	  format = "{stateIcon} {artist} - {title}";
	  state-icons = {
	    paused = "";
	    playing = "" ;
	  };
	};
        pulseaudio = {
	  format = "{icon} {volume}%";
	  format-muted = "󰝟 Muted";
	  format-icons = {
            headphones = "󰋋 ";
            hands-free = "󱡏 ";
            headset = "󰋎 ";
	    car = "󰋋 ";
	    default = ["󰕿" "󰖀" "󰕾"];
	  };
	};
        battery = {
	  format = "{icon} {capacity}%";
	  format-full = "󰁹 {capacity}%";
	  format-charging = "󰂄 {capacity}%";
	  format-plugged = "󰂅  {capacity}%";
          format-icons = [ "󰂃 " "󰁻 " "󰁽 " "󰁿 " "󰂁 " ];
        };
        "battery#bat0" = {
	  device = "BAT0";
	};
      };
    };
  };
}
