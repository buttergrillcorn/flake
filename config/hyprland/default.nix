{ inputs, lib, config, pkgs, ...}:
{

  imports = [
    ../waybar
    ../kitty
    ./fuzzel.nix
    ./config.nix
  ];

  home.packages = with pkgs; [
    libsForQt5.polkit-kde-agent
    xdg-desktop-portal-hyprland
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
    networkmanagerapplet
  ];

  wayland.windowManager.hyprland.enable = true;

  services.swayidle = {
    enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.fluent-gtk-theme;
      name = "Fluent-Remix-GTK-Grey-Dark";
    };

    iconTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir-Dark";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
