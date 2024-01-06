{ inputs, lib, config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono SC NF";
      size = 12;
    };
    theme = "Tomorrow Night";
  };
}
