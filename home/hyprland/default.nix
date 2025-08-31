{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      exec-once = [
        "waybar"
      ];

      monitor = [
        "eDP-1,3456x2160@165,0x0,1.8"
      ];

      misc = {
        disable_hyprland_logo = true;
	disable_splash_rendering = true;
      };

      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
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
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      input = {
        touchpad = {
          clickfinger_behavior = 1;
	};
        kb_layout = "dh";
	kb_options = "caps:super,altwin:ctrl_win";
        follow_mouse = 0;
      };
    };
  };
}
