{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    xwayland-satellite
    rofi
    wl-clipboard
    grim
    slurp
    swappy
  ];

  services.polkit-gnome.enable = true;
  services.gnome-keyring.enable = true;
  services.network-manager-applet.enable = true;
  services.cliphist.enable = true;
  services.swww.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  services.swaync.enable = true;
  services.udiskie.enable = true;

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

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
