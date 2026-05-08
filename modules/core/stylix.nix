{
  config,
  lib,
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;

    image = ../../wallpapers/snow_fox_purple.png;

    fonts = {
      serif = {
        package = pkgs.noto-fonts-cjk-serif;
        name = "Noto Serif CJK SC";
      };

      sansSerif = {
        package = pkgs.noto-fonts-cjk-sans;
        name = "Noto Sans CJK SC";
      };

      monospace = {
        package = pkgs.maple-mono.NF-CN;
        name = "Maple Mono NF CN";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;
    };

    icons = {
      enable = true;
      package = pkgs.qogir-icon-theme;
      dark = "Qogir-dark";
      light = "Qogir";
    };
  };

  home-manager.sharedModules = [
    {
      stylix.targets = {
        waybar.addCss = false;
        firefox.profileNames = [ "default" ];
      };
    }
  ];
}
