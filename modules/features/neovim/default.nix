{
  pkgs,
  ...
}:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      # Languages
      nixfmt
      nil
      statix
      stylua
      shfmt
      vscode-langservers-extracted
      lua-language-server
      bash-language-server
    ];

    extraPlugins = with pkgs; [
      vimPlugins.org-roam-nvim
      vimPlugins.bigfile-nvim
    ];

    extraConfigLua = ''
      require('org-roam').setup({
        directory = "~/org",
      })
    '';

    colorschemes.vague.enable = true;

    opts = {
      laststatus = 3;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      cmdheight = 0;
      number = true;
      relativenumber = true;
      termguicolors = true;
      conceallevel = 2;
      concealcursor = "nc";
      cursorline = true;
      cursorlineopt = "both";
      scrolloff = 10;
      ignorecase = true;
      smartcase = true;
      foldmethod = "indent";
      foldlevel = 4;
      spell = true;
      spelllang = "en_gb";
      clipboard = "unnamedplus";
      backup = false;
      undofile = true;
      inccommand = "split";
    };

    clipboard.providers.wl-copy.enable = true;

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      luasnip.enable = true;
      lazygit.enable = true;
      neogit.enable = true;
      bufferline.enable = true;
      flash.enable = true;
      fidget.enable = true;
      nvim-autopairs.enable = true;
      todo-comments.enable = true;
      ts-comments.enable = true;
      tmux-navigator.enable = true;
      nui.enable = true;
      dressing.enable = true;
      toggleterm.enable = true;
      zen-mode.enable = true;

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          bashls.enable = true;
          lua_ls.enable = true;
          cssls.enable = true;
        };
      };

      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          ensure_installed = [
            "nix"
            "css"
            "lua"
            "html"
            "bash"
            "markdown"
            "markdown_inline"
            "org"
            "regex"
            "diff"
            "query"
          ];
          highlight.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(arg.body) end";
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "orgmode"; }
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
          # Disable org roam buffer completion
          enabled = {
            __raw = ''
              function()
                local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
                local bufname = vim.api.nvim_buf_get_name(0)
                if buftype == "prompt" then return false end
                if bufname:match("org%-roam%-select") then return false end
                if buftype == "nofile" then return false end
                return true
              end
            '';
          };
        };
      };

      which-key = {
        enable = true;
        settings = {
          preset = "helix";
          win = {
            border = "single";
          };
          keys = {
            scroll_down = "<c-j>";
            scroll_up = "<c-k>";
          };
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
            {
              __unkeyed-1 = "<leader>n";
              group = "Notes";
            }
            {
              __unkeyed-1 = "<leader>nd";
              group = "Journal";
            }
            {
              __unkeyed-1 = "<leader>o";
              group = "Org Mode";
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
            lua = [ "stylua" ];
            nix = [ "nixfmt" ];
            sh = [ "shfmt" ];
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          nix = [ "statix" ];
        };
      };

      alpha = {
        enable = true;
        theme = "dashboard";
      };

      mini = {
        enable = true;
        modules = {
          pairs = {
            modes = {
              insert = true;
              command = true;
              terminal = true;
            };
            skip_ts = [ "string" ];
            skip_unbalanced = true;
            markdown = true;
          };
          ai = { };
          icons = { };
          indentscope = { };
        };
      };

      notify = {
        enable = true;
        backgroundColor = "#000000";
      };

      orgmode = {
        enable = true;
        settings = {
          org_agenda_files = "~/org/**/*";
          org_hide_leading_stars = true;
          org_hide_emphasis_markers = true;
          org_ellipsis = "[...]";
          org_log_into_drawer = "LOGBOOK";
          org_startup_indented = true;
          mappings = {
            org = {
              org_open_at_point = "<CR>";
            };
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
        action = "<cmd>confirm qa<CR>";
        options.desc = "Quit (With Prompt)";
      }

      {
        mode = "n";
        key = "<leader>qQ";
        action = "<cmd>qa!<CR>";
        options.desc = "Force Quit (All)";
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

      # --- Flash ---
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "s";
        action = "<cmd>lua require('flash').jump()<CR>";
        options.desc = "Flash Jump";
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "S";
        action = "<cmd>lua require('flash').treesitter()<CR>";
        options.desc = "Flash Treesitter";
      }
    ];
  };
}
