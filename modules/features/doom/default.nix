{ pkgs, ... }:
{
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
    emacs = pkgs.emacs-pgtk;
    extraBinPackages = with pkgs; [
      git
      fd
      ripgrep
      gcc
      gnumake
      semgrep
      # Nix
      nil
      nixd
      typos-lsp
      # Python
      python3Packages.python-lsp-server
      ruff
      # Spelling
      (aspellWithDicts (
        dicts: with dicts; [
          en
          en-computers
          en-science
        ]
      ))
    ];
  };
}
