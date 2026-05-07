{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --cmd niri-session";
        user = "greeter";
      };
    };
  };

  services.displayManager.enable = true;
  services.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.tlp.enable = true;

  # --- XDG Portal ---
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = [ "gtk" ];
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ]; # Because Nautilus isn't installed
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
