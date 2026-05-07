{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
        OBS_VKCAPTURE = true;
      };
      extraArgs = "-system-composer";
    };
    extest.enable = true;
    extraPackages = with pkgs; [
      gamescope
    ];
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];

  hardware.xpadneo.enable = true;

  # 8BitDo Controller
  services = {
    udev = {
      packages = with pkgs; [
        game-devices-udev-rules
      ];
    };
  };
  hardware.uinput.enable = true;
}
