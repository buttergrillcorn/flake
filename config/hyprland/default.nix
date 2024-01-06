{ inputs, lib, config, pkgs, ...}:
{

  imports = [
    ../waybar
    ../kitty
    ./fuzzel.nix
    ./config.nix
  ];

  home.packages = with pkgs; [
    noisetorch
    blueman
    swww
    udiskie
    wl-clipboard
    clipman
    waybar
    fuzzel
    swaylock
    hyprpicker
    dunst
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs; [
      hyprshot
      xdg-desktop-portal-hyprland
      libsForQt5.polkit-kde-agent
    ];
  };

  services.swayidle = {
    enable = true;
  };

}
