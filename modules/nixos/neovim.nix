{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.modules.neovim.enable = lib.mkEnableOption "neovim with nixvim";
  };

  config = lib.mkIf config.my.modules.neovim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        nixfmt
        ripgrep
        fd
      ];

      colorschemes.catppuccin.enable = true;

      opts = {
        laststatus = 3;
        shiftwidth = 2;
        number = true;
        relativenumber = true;
        termguicolors = true;
      };

      plugins = {
        lualine.enable = true;
        telescope.enable = true;
        treesitter.enable = true;
        web-devicons.enable = true;
        lazygit.enable = true;
        neogit.enable = true;
        bufferline.enable = true;
        nvim-autopairs.enable = true;
        todo-comments.enable = true;
        tmux-navigator.enable = true;

        lsp = {
          enable = true;
          servers = {
            nil_ls.enable = true;
            bashls.enable = true;
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;
          settings.sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
        };

        which-key = {
          enable = true;
          settings = {
            spec = [
              {
                __unkeyed-1 = "<leader>f";
                group = "File/Find";
              }
              {
                __unkeyed-1 = "<leader>g";
                group = "Git";
              }
              {
                __unkeyed-1 = "<leader>q";
                group = "Quit/Session";
              }
              {
                __unkeyed-1 = "<leader>c";
                group = "Code";
              }
              {
                __unkeyed-1 = "<leader>b";
                group = "Buffer";
              }
            ];
          };
        };

        gitsigns = {
          enable = true;
          settings = {
            current_line_blame = true;
          };
        };

        oil = {
          enable = true;
          settings = {
            view_options.show_hidden = true;
            default_file_explorer = true;
            delete_to_trash = true;
            columns = [
              "icons"
              "permissions"
              "size"
              "mtime"
            ];
            float = {
              padding = 2;
              max_width = 45;
              max_height = 40;
              border = "solid";
              win_options = {
                winblend = 0;
              };
            };
          };
        };

        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = {
              lsp_fallback = true;
              timeout_ms = 500;
            };
            formatters_by_ft = {
              nix = [ "nixfmt" ];
            };
          };
        };

        notify = {
          enable = true;
          backgroundColor = "#000000";
        };

        noice = {
          enable = true;
          settings = {
            presets = {
              bottom_search = true;
              command_palette = true;
              long_message_to_split = true;
            };
          };
        };

      };

      globals.mapleader = " ";

      keymaps = [
        {
          mode = "n";
          key = "<leader>ff";
          action = "<cmd>Telescope find_files<CR>";
          options.desc = "Find Files";
        }

        {
          mode = "n";
          key = "-";
          action = "<cmd>Oil --float<CR>";
          options.desc = "Open Parent Directory";
        }

        {
          mode = "n";
          key = "<leader>fg";
          action = "<cmd>Telescope live_grep<CR>";
          options.desc = "Live Grep (Text)";
        }

        {
          mode = "n";
          key = "<leader>fs";
          action = "<cmd>:w<CR>";
          options.desc = "File Save";
        }
        {
          mode = "n";
          key = "<leader>gg";
          action = "<cmd>Neogit<CR>";
          options.desc = "Open Neogit";
        }

        {
          mode = "n";
          key = "<leader>gl";
          action = "<cmd>LazyGit<CR>";
          options.desc = "Open LazyGit";
        }

        {
          mode = "n";
          key = "<leader>gh";
          action = "<cmd>Gitsigns preview_hunk<CR>";
          options.desc = "Preview Git Hunk";
        }

        {
          mode = "n";
          key = "<leader>cf";
          action = "<cmd>lua require('conform').format()<CR>";
          options.desc = "Format Buffer";
        }

        {
          mode = "n";
          key = "<leader>qq";
          action = "<cmd>wq<CR>";
          options.desc = "Save and Quit";
        }

        {
          mode = "n";
          key = "<leader>qQ";
          action = "<cmd>q!<CR>";
          options.desc = "Force Quit";
        }

        # --- Buffers

        {
          mode = "n";
          key = "<leader>bd";
          action = "<cmd>bdelete<CR>";
          options.desc = "Delete Buffer";
        }

        {
          mode = "n";
          key = "L";
          action = "<cmd>bnext<CR>";
          options.desc = "Next Buffer";
        }

        {
          mode = "n";
          key = "H";
          action = "<cmd>bprevious<CR>";
          options.desc = "Previous Buffer";
        }
      ];
    };
  };
}
