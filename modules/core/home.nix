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
}
