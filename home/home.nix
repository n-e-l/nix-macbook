{ config, pkgs, stylix, ... }:

{

  imports = [
    stylix.homeModules.stylix
    ./direnv.nix
    ./hyprland
    ./neovim
    ./waybar
  ];

  # Disable dconf to prevent the service error
  dconf.enable = false;

  # Color scheme
  stylix = {
    enable = true;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    targets = {
      kitty.enable = true;
      neovim.enable = true;
    };
  };

  home.username = "lauda";
  home.homeDirectory = "/home/lauda";

  home.stateVersion = "25.05";

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
    BROWSER = "vivaldi";
    PATH = "$PATH:/home/lauda/.cargo/bin";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = "vivaldi-stable.desktop";
      "text/html" = "vivaldi-stable.desktop";
      "x-scheme-handler/http" = "vivaldi-stable.desktop";
      "x-scheme-handler/https" = "vivaldi-stable.desktop";
    };
  };

  home.packages = with pkgs; [
    nix-output-monitor
    git
    vivaldi
    kitty
    vim
    xdg-utils
    gotop
    ranger
    wget
    neofetch
    rofi-wayland
    legcord
    widevine-cdm
    firefox
    jetbrains.rust-rover
    python3
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lauda/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Software configuration

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      custom = "/etc/nixos/home/zsh/themes";
      theme = "blinks-mag";
      plugins = [
        "git"
	"sudo"
	"docker"
      ];
    };

    syntaxHighlighting.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  fonts.fontconfig.enable = true;

}
