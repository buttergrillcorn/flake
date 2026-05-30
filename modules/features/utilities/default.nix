{ pkgs, ... }:
{
  imports = [
    ./anyrun.nix
    ./fuzzel.nix
  ];

  home.packages = with pkgs; [
    # --- Network ---
    networkmanager_dmenu
    proton-vpn
    # --- Audio ---
    wiremix
    pamixer
    # --- Video ---
    mpv-unwrapped
    yt-dlp-light
    # --- File Management ---
    yazi
    # --- PDF ---
    zathura
  ];

  # --- External Storage ---
  services.udiskie.enable = true;

  # --- KDE Connect ---
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
