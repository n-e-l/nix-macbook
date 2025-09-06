{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      animations = {
        enabled = false;
      };

      exec-once = [
        "waybar"
      ];

      monitor = [
        "HDMI-A-1,3456x2160@165,0x0,1.875"
        "eDP-1,3456x2160@165,2050x0,1.8"
      ];

      general = {
        gaps_in = 1;
	gaps_out = 5;
	border_size = 1;
	layout = "dwindle";
      };

      misc = {
        disable_hyprland_logo = true;
	disable_splash_rendering = true;
      };

      workspace = [
        "1, monitor:HDMI-A-1"
        "2, monitor:HDMI-A-1"
        "3, monitor:HDMI-A-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
        "9, monitor:eDP-1"
        "10, monitor:eDP-1"
      ];

      # Key bindings
      "$mod" =  "SUPER";

      bind = [
        # Application shortcuts
        "$mod, Return, exec, kitty"
	"$mod, Q, killactive"
        "$mod, D, exec, rofi -show drun"
	"$mod, P, exec, grim -g \"$(slurp)\" - | wl-copy"

        # Move focus with mainMod + hjkl
        "$mod, m, movefocus, l"
        "$mod, i, movefocus, r"
        "$mod, e, movefocus, u"
        "$mod, n, movefocus, d"

        # Move window with mainMod + hjkl
        "$mod SHIFT, m, movewindow, l"
        "$mod SHIFT, i , movewindow, r"
        "$mod SHIFT, e, movewindow, u"
        "$mod SHIFT, n, movewindow, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to workspace [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

	# Volume
        ", XF86AudioRaiseVolume, exec, pamixer --increase 5"
	", XF86AudioLowerVolume, exec, pamixer --decrease 5"
	", XF86AudioMute, exec, pamixer --toggle-mute"

 	# Brightness
	", XF86MonBrightnessUp, exec, brightnessctl set +10%"
	", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      input = {
        touchpad = {
	  disable_while_typing = false;
          clickfinger_behavior = 1;
	  tap-to-click = false;
	};
        kb_layout = "dh";
	kb_options = "caps:super,altwin:ctrl_win";
        follow_mouse = 0;
      };
    };
  };
}
