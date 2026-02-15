{ pkgs, ... }:
{
  imports = [
    ./screen.nix
  ];

  home.packages = with pkgs; [
    # --- Network ---
    networkmanager_dmenu
    # --- Audio ---
    wiremix
    pamixer
    # --- File Management ---
    yazi
  ];

  # --- External Storage ---
  services.udiskie.enable = true;

  # --- KDE Connect ---
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
