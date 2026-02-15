{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}:
let
  t480BatteryScript = pkgs.writeShellScriptBin "t480-battery" (builtins.readFile ./battery.sh);
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = import ./config.nix {
      inherit
        lib
        pkgs
        config
        osConfig
        ;
      batteryScript = "${t480BatteryScript}/bin/t480-battery";
    };
    style = import ./style.nix { inherit config; };
    # style = builtins.readFile ./style.css;
  };

  # For my custom battery script
  home.packages = [ pkgs.gawk ];
}
