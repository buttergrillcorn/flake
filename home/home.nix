{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ../config/hyprland
    ../config/nixvim
  ];

  home.file = {
    "Pictures/monochrome-building.jpeg".source = ../config/monochrome-building.jpeg;
    # ".config/nvim".source = ../config/neovim;
    ".config/doom".source = ../config/doom;
    ".config/ranger/rc.conf".text = "set preview_images true\nset preview_images_method kitty";
  };

  home = {
    username = "james";
    homeDirectory = "/home/james";     
  };

  home.packages = with pkgs; [
    # DOOM Emacs dependencies
    binutils
    (ripgrep.override { withPCRE2 = true; })
    gnutls
    fd
    imagemagick
    zstd
    nodePackages.javascript-typescript-langserver
    sqlite
    editorconfig-core-c
    emacs-all-the-icons-fonts
    libvterm
    libtool
    cmake
    gnumake
    libgcc
    python3

    # Rust
    rust-analyzer
    # rustup

    # Must
    cinnamon.nemo-with-extensions
    firefox
    ranger
    python311Packages.pillow
    w3m
    fzf
    fd
    bat
    grc

    helix

    # Communication
    # webcord-vencord
    # discord-screenaudio
    webcord
    discord
    # vesktop

    # Gaming
    steam
    lutris
    bottles

    # Utilities
    calibre
    pureref
  ];

  
  programs.git = {
    enable = true;
    userEmail = "jamesyuli@outlook.com";
    userName = "buttergrillcorn";
  };

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;

  # Emacs
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.vterm
      epkgs.vterm-toggle
    ];
  };
  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = true;
    socketActivation.enable = true;
  };

  # Neovim
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = false;
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   plugins = with pkgs.vimPlugins; [
  #     # gruvbox-material
  #     luasnip
  #     friendly-snippets
  #     nvim-cmp
  #     cmp-nvim-lsp
  #     cmp-buffer
  #     cmp-path
  #     cmp_luasnip
  #     mini-nvim
  #     neo-tree-nvim
  #     telescope-fzf-native-nvim
  #     flash-nvim
  #     nvim-spectre
  #     which-key-nvim
  #     gitsigns-nvim
  #     vim-illuminate
  #     trouble-nvim
  #     todo-comments-nvim
  #     telescope-nvim
  #     conform-nvim
  #     nvim-lint
  #     mason-nvim
  #     mason-lspconfig-nvim
  #     nvim-lspconfig
  #     neodev-nvim
  #     nvim-treesitter
  #     nvim-treesitter-textobjects
  #     nvim-treesitter-context
  #     nvim-ts-autotag
  #     nvim-notify
  #     dressing-nvim
  #     bufferline-nvim
  #     lualine-nvim
  #     indent-blankline-nvim
  #     noice-nvim
  #     nvim-web-devicons
  #     nui-nvim
  #     dashboard-nvim
  #     vim-startuptime
  #     alpha-nvim
  #     plenary-nvim
  #     persistence-nvim
  #     lazygit-nvim
  #     lazy-nvim
  #     lazy-lsp-nvim
  #     LazyVim
  #     orgmode
  #   ];
  # };

  programs.lazygit.enable = true;

  # gtk.theme = "breeze-gtk";

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

      {
        name = "boxfish";
        src = pkgs.fetchFromGitHub {
          owner = "joelwanner";
          repo = "theme-boxfish";
          rev = "7c448cef4c61e7b66e8f57afd14c6a6764b19dc7";
          sha256 = "sha256-vW5qE9WQhG7gQE1SHCksj0wNm324GwvGaTBGKMyIJuk=";
        };
      }

      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }

      { name = "colored-man-pages"; src = pkgs.fishPlugins.colored-man-pages.src; }

      { name = "done"; src = pkgs.fishPlugins.done.src; }

      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }

      { name = "grc"; src = pkgs.fishPlugins.grc.src; }

      { name = "bass"; src = pkgs.fishPlugins.bass.src; }

      { name = "tide"; src = pkgs.fishPlugins.tide.src; }

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

  # Gammastep
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
  };

  systemd.user.startServices = "sd-switch";

#########################################################################

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";

}
