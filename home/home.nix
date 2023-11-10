{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    
  ];

  nixpkgs = {
    
  };
  
  home = {
    username = "james";
    homeDirectory = "/home/james";     
  };

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userEmail = "jamesyuli@outlook.com";
    userName = "buttergrillcorn";
  };

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;

  programs.emacs.enable = true;

  # Emacs
  services.emacs = {
    enable = true;
    client.enable = true;
    socketActivation.enable = true;
  };

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-material
      luasnip
      friendly-snippets
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp_luasnip
      mini-nvim
      neo-tree-nvim
      telescope-fzf-native-nvim
      flash-nvim
      nvim-spectre
      which-key-nvim
      gitsigns-nvim
      vim-illuminate
      trouble-nvim
      todo-comments-nvim
      telescope-nvim
      conform-nvim
      nvim-lint
      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig
      neodev-nvim
      nvim-treesitter
      nvim-treesitter-textobjects
      nvim-treesitter-context
      nvim-ts-autotag
      nvim-notify
      dressing-nvim
      bufferline-nvim
      lualine-nvim
      indent-blankline-nvim
      noice-nvim
      nvim-web-devicons
      nui-nvim
      dashboard-nvim
      vim-startuptime
      alpha-nvim
      plenary-nvim
      persistence-nvim
      lazygit-nvim
      lazy-nvim
      lazy-lsp-nvim
      LazyVim
      orgmode
    ];
  };

  programs.lazygit.enable = true;

  gtk.theme = "breeze-gtk";

  # Fish
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "fasd";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-fasd";
          rev = "38a5b6b6011106092009549e52249c6d6f501fba";
          sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";
        };
      }
    ];
    shellAliases = {
      up = "sudo nixos-rebuild switch --flake ~/.flake/. ";
    };
    functions = {
      fish_greeting = "";
    };
  };

  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox_dark_hard";
      editor = {
        line-number = "relative";
      };
      keys.normal = {
          space.w = ":w";
          space.q = ":q";
      };
    };
    defaultEditor = false;
  };

  home.file.".config/nvim".source = ../config/neovim;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
