{
  programs.nixvim.plugins = {
    lualine.enable = true;
    nvim-autopairs.enable = true;
    luasnip.enable = true;

    nvim-cmp = {
      enable = true;
      snippet.expand = "luasnip";
      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
        "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-CR>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace})";
        "<C-CR>" = "function(fallback) cmp.abort() fallback() end";
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; } #For luasnip users.
        { name = "path"; }
        { name = "buffer"; }
      ];
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;

    mini = {
      enable = true;
      modules = {
        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";
            update_n_lines = "gsn";
          };
        };
        ai = {
          n_lines = 500;
        };
        bufremove = {};
      };
    };

    ts-context-commentstring = {
      enable = true;
      extraOptions = {
        enable_autocmd = false;
      };
    };

    neo-tree = {
      enable = true;
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];
      window = {
        mappings = {
          "<space>" = "none";
        };
      };
      defaultComponentConfigs = {
        indent = {
          withExpanders = true;
          expanderCollapsed = ">";
          expanderExpanded = "v";
          expanderHighlight = "NeoTreeExpander";
        };
      };
    };

    telescope = {
      enable = true;
      defaults = {
        promptPrefix = " ";
        selectionCaret = " ";
      };
    };

    flash.enable = true;

    which-key = {
      enable = true;
      plugins.spelling.enabled = true;
      registrations = {
        "g" = "+ goto";
        "gs" = "+ surround";
        "[" = "+ prev";
        "]" = "+ next";
        "<leader><tab>" = "+ tabs";
        "<leader>b" = "+ buffer";
        "<leader>c" = "+ code";
        "<leader>f" = "+ file/find";
        "<leader>g" = "+ git";
        "<leader>gh" = "+ hunk";
        "<leader>q" = "+ quit/session";
        "<leader>s" = "+ search";
        "<leader>u" = "+ UI";
        "<leader>w" = "+ windows";
        "<leader>x" = "+ diagnostics";
      };
    };

    gitsigns.enable = true;

    illuminate = {
      enable = true;
      delay = 200;
      largeFileCutoff = 2000;
      largeFileOverrides = {
        providers = [ "lsp" ];
      };
    };

    trouble = {
      enable = true;
      useDiagnosticSigns = true;
    };

    todo-comments.enable = true;

    conform-nvim.enable = true;

    lint.enable = true;

    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        marksman.enable = true;
        cssls.enable = true;
        clangd.enable = true;
        bashls.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        gopls.enable = true;
      };
    };

    lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
          orgmode = "[orgmode]";
        };
      };
    };

    lsp-lines.enable = true;

    treesitter = {
      enable = true;
      indent = true;
      ensureInstalled = "all";
      nixvimInjections = true;
      incrementalSelection.enable = true;
    };

    treesitter-textobjects.enable = true;

    treesitter-context = {
      enable = true;
      mode = "cursor";
    };

    ts-autotag.enable = true;

    indent-blankline = {
      enable = true;
      scope.enabled = true;
    };

    noice = {
      enable = true;
      lsp.override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
        lsp_doc_border = true;
      };
    };

    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            "██████   █████    █████    █████ █████    █████   █████    █████    ██████   ██████"
            "░░██████ ░░███    ░░███    ░░███ ░░███    ░░███   ░░███    ░░███    ░░██████ ██████"
            "░███░███ ░███     ░███     ░░███ ███      ░███    ░███     ░███     ░███░█████░███"
            "░███░░███░███     ░███      ░░█████       ░███    ░███     ░███     ░███░░███ ░███"
            "░███ ░░██████     ░███       ███░███      ░░███   ███      ░███     ░███ ░░░  ░███"
            "░███  ░░█████     ░███      ███ ░░███      ░░░█████░       ░███     ░███      ░███"
            "█████  ░░█████    █████    █████ █████       ░░███         █████    █████     █████"
            "░░░░░    ░░░░░    ░░░░░    ░░░░░ ░░░░░         ░░░         ░░░░░    ░░░░░     ░░░░░"
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              command = "<CMD>ene <CR>";
              desc = "  New file";
              shortcut = "SPC nf";
            }
            {
              command = ":qa<CR>";
              desc = "  Quit Neovim";
              shortcut = "SPC qa";
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Keyword";
            position = "center";
          };
          type = "text";
          val = "Inspiring quote here.";
        }
      ];
    };
  };
}
