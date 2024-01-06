{ inputs, lib, config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    font = "Maple Mono SC NF 12";
    backgroundColor = "#202020";
    textColor = "#9f9f9f";
    width = 400;
    height = 200;
    padding = "15";
    borderSize = 2;
    borderColor = "#dfdfdf";
    progressColor = "over #1dfdfdf";
    icons = true;
    layer = "overlay";
    extraConfig = ''
      max-icon-size=32
      [urgency=high]
      border-color=#bb2205
    '';
  };
}
