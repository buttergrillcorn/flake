{ inputs, lib, config, pkgs, ...}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = "yes";
        font = "JetBrains Mono Nerd:size=12";
        terminal = "${pkgs.kitty}/bin/kitty";
        prompt = "Launch :  ";
        width = 15;
        layer = "overlay";
        icons-enabled = "no";
        lines = 15;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 10;
        exit-on-keyboard-focus-loss = "true";
      };
      colors = {
        background = "202020ff";
        text = "9f9f9fff";
        match = "606060ff";
        selection-match = "dfdfdfff";
        selection = "606060ff";
        selection-text = "202020ff";
        border = "dfdfdfff";
      };
      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
