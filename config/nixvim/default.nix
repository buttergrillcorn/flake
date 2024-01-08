{ inputs, lib, config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    colorschemes.base16 = {
      enable = true;
      colorscheme = "tomorrow-night";
    };
  };
}
