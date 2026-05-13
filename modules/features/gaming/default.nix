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
  hardware.steam-hardware.enable = true;

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
  services.udev.extraRules = ''
    # 8BitDo Pro 2; Bluetooth; D-Input Mode
    KERNEL=="hidraw*", KERNELS=="*2DC8:6003*", MODE="0660", TAG+="uaccess", GROUP="input"

    # 8BitDo Pro 2; Wired; D-Input Mode (if you ever plug it in)
    KERNEL=="hidraw*", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="6003", MODE="0660", TAG+="uaccess", GROUP="input"
  '';
  boot.blacklistedKernelModules = [ "hid_nintendo" ];
}
