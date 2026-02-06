{ pkgs, lib, config, inputs, ... }:

{
  options = {
      my.modules.niri.enable = lib.mkEnableOption "niri window manager";
  };

  config = lib.mkIf config.my.modules.niri.enable {
    programs.niri.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.polkit.enable = true;

    environment.systemPackages = with pkgs; [
      waybar
      mako
      libnotify
      wl-clipboard
      rofi
    ];
  };
}
