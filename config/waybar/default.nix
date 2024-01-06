{ inputs, lib, config, pkgs, ...}:

{
  programs.waybar.enable = true;

  imports = [
    ./config.nix
    ./style.nix
  ];

  # home.file = {
  #   ".config/waybar".source = ../waybar ;
  #   recursive = true;
  # };
}
