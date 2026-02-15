{ pkgs, ... }:
{
  imports = [
  ];

  home.packages = with pkgs; [
    git
    fd
    lazygit
    fzf
    ripgrep
    btop
    gemini-cli
    libgcc
    tree-sitter
    bat
    eza
    chafa
    zoxide
    jq
  ];
}
