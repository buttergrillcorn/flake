{ inputs, lib, config, pkgs, ...}:

{
  programs.waybar.enable = true;

  imports = [
    ../waybar
  ];

  # home.file = {
  #   ".config/waybar".source = ../waybar ;
  #   recursive = true;
  # };
}
