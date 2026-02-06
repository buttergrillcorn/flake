{ pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
    ../../modules/nixos
  ];

  home-manager.users.james = import ../../home.nix;

  my.modules = {
    niri.enable = true;
    neovim.enable = true;
  };

  services.xserver.xkb.options = "ctrl:nocaps";

  networking.hostName = "T480";

  system.stateVersion = "25.11";

}
