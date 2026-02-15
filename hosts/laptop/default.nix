{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./throttled.nix
    ../../modules/core/configuration.nix

    # --- Niri WM ---
    ../../modules/features/niri/system.nix

    # --- Shell ---
    ../../modules/features/shell/default.nix
  ];

  home-manager.users.james = {
    imports = [
      inputs.nixvim.homeModules.nixvim
      inputs.nix-doom-emacs-unstraightened.homeModule
      inputs.sops-nix.homeManagerModules.sops
      ../../modules/core/home.nix

      # --- Home Modules ---
      ../../modules/features/niri/home.nix
      ../../modules/features/shell/fish.nix
      ../../modules/features/neovim
      ../../modules/features/waybar
      ../../modules/features/doom
      ../../modules/features/cli
      ../../modules/features/utilities
    ];
  };

  programs.light = {
    enable = true;
    brightnessKeys = {
      enable = true;
      step = 10;
      minBrightness = 0.1;
    };
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
  };

  # --- Swap ---
  powerManagement.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024;
    }
  ];

  boot.kernelParams = [ "resume_offset=19735808" ];

  # boot.resumeDevice = "/dev/disk/by-uuid/6570630c-618e-4384-b273-c59ce573da14";
  boot.resumeDevice = "/dev/disk/by-uuid/6570630c-618e-4384-b273-c59ce573da14";

  # ---

  services.xserver.xkb.options = "ctrl:nocaps";

  services.gnome.gnome-keyring.enable = true;

  services.tlp.enable = true;

  networking.hostName = "T480";

  # --- Boot Configuration ---
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      # Arch Linux on T480
      extraEntries = ''
        menuentry "Arch Linux" {
        insmod btrfs
        search --set=root --fs-uuid 05f5d9a3-3b57-4eee-95c8-0fd424b0cbed
        linux /@/boot/vmlinuz-linux root=UUID=05f5d9a3-3b57-4eee-95c8-0fd424b0cbed rootflags=subvol rw
        initrd /@/boot/initramfs-linux.img
        }
      '';
    };
  };

  system.stateVersion = "25.11";

}
