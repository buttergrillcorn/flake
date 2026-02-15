{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages =
      epkgs: with epkgs; [
        vterm
        use-package
        magit
        org
      ];
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    startWithUserSession = "graphical";
    # socketActivation.enable = true;
    client.enable = true;
    # client.arguments = [ "-c" ];
  };

  home.packages = with pkgs; [
    cmake
    libtool
  ];

  # programs.emacs.extraPackages =
  #   epkgs: with epkgs; [
  #     vterm
  #     use-package
  #     magit
  #     org
  #   ];
}
