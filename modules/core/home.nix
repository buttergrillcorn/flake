{ config, pkgs, ... }:

{

  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "25.11";
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.sessionPath = [
    "{config.home.homeDirectory}/.config/emacs/bin"
  ];

  programs.home-manager.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
      # Default File App
      "inode/directory" = "thunar.desktop";
      # Images
      "image/png" = "org.xfce.ristretto.desktop";
      "image/jpeg" = "org.xfce.ristretto.desktop";
      "image/gif" = "org.xfce.ristretto.desktop";
      "image/webp" = "org.xfce.ristretto.desktop";
    };
  };
}
