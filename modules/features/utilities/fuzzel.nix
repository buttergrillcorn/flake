{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = "yes";
        prompt = "‎ ";
        show-actions = "yes";
        lines = 15;
        minimal-lines = "yes";
        width = 32;
        tabs = 4;
        horizontal-pad = 10;
        vertical-pad = 8;
        inner-pad = 8;
        auto-select = "yes";
      };
      border = {
        width = 2;
        radius = 0;
      };
      key-bindings = {
        next-with-wrap = "Control+j";
        prev-with-wrap = "Control+k";
        delete-line-forward = "none";
      };
    };
  };
}
