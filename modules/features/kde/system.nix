{
  services.desktopManager.plasma6.enable = true;

  services.displayManager.plasma-login-manager.enable = true;

  programs.kdeconnect.enable = true;

  networking.firewall = rec {
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [ 4445 ];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
