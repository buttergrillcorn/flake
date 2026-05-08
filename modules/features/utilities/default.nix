{ pkgs, ... }:
{
  imports = [
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

  # --- File Management (Thunar) ---
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-vcs-plugin
      thunar-shares-plugin
      thunar-media-tags-plugin
      ffmpegthumbnailer # Video thumbnail
    ];
  };
  services.gvfs.enable = true; # For trash, mounting, etc.
  services.tumbler.enable = true; # For image thumbnails.

  # --- External Storage ---
  services.udiskie.enable = true;

  # --- KDE Connect ---
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
