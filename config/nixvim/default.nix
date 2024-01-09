{
  imports = [
    ./keymap.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.base16.enable = true;
    colorschemes.base16.colorscheme = "tomorrow-night";

    options = {
      number = true;
      relativenumber = true;
      autoindent = true;
      fileencoding = "utf-8";
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };
}
