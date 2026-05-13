{ config, pkgs, ... }:

{
  imports = [
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # --- Network ---
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-lua
        qt6Packages.fcitx5-chinese-addons
        qt6Packages.fcitx5-configtool
      ];
    };
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.james = {
    isNormalUser = true;
    description = "James";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
  };

  # Fix man-cache slow rebuild
  documentation.man.cache.enable = false;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/james/flake";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    kitty
    nh
    direnv
    trashy
    brightnessctl
  ];

  services.udisks2.enable = true;

  # --- File Management (Thunar) ---
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-vcs-plugin
      thunar-shares-plugin
      thunar-media-tags-plugin
      ffmpegthumbnailer # Video thumbnail
    ];
  };
  services.gvfs.enable = true; # For trash, mounting, etc.
  services.tumbler.enable = true; # For image thumbnails.

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    maple-mono.NF
    maple-mono.NF-CN
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "25.11"; # Did you read the comment?

}
