{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ../waybar
    ../utilities/screen.nix # Idle and lock management
    ../utilities/swaync.nix # Notification
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    grim
    slurp
    swappy
  ];

  services.network-manager-applet.enable = true;
  programs.rofi.enable = true;
  services.cliphist.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  services.hyprpaper.enable = true;
  services.udiskie.enable = true;

  # --- Bluetooth ( Bluetuith ) ---
  programs.bluetuith = {
    enable = true;
    settings = {
      keybindings = {
        Menu = "m";
        Quit = "q";
        NavigateUp = "k";
        NavigateDown = "j";
        NavigateLeft = "h";
        NavigateRight = "l";
      };
    };
  };

  # --- Systemd Services ---
  systemd.user.services = {
    # --- XWayland Satellite
    xwayland-satellite = {
      Unit = {
        Description = "XWayland Satellite";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${lib.getExe pkgs.xwayland-satellite}";
        Restart = "on-failure";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };

  xdg.configFile."niri/config.kdl".text =
    builtins.replaceStrings
      [ "@base0D@" "@base03@" ]
      [
        config.lib.stylix.colors.withHashtag.base0D
        config.lib.stylix.colors.withHashtag.base03
      ]
      (builtins.readFile ./config.kdl);
}
