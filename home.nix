{ config, pkgs, ... }:

{ 
  home.username = "james";
  home.homeDirectory = "/home/james";
  home.stateVersion = "25.11"; 

  home.packages = with pkgs; [
    hello
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
