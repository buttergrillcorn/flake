# Home Manager module
{ config, pkgs, lib ? pkgs.lib, ... }:

let
  cfg = config.programs.neovim-ide;
  set = pkgs.neovimBuilder { config = cfg.settings; };
in
with lib; {
  meta.maintainers = [ maintainers.cfryer ];

  options.programs.neovim-ide = {
    enable = mkEnableOption "NeoVim with LazyVim config recreated in nix";

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
      example = literalExpression ''
        {
          vim.viAlias = false;
          vim.vimAlias = true;
          vim.lsp = {
            enable = true;
            formatOnSave = true;
            lightbulb.enable = true;
            lspsaga.enable = false;
            nvimCodeActionMenu.enable = true;
            trouble.enable = true;
            lspSignature.enable = true;
            rust.enable = false;
            nix = true;
            dhall = true;
            elm = true;
            haskell = true;
            sql = true;
            python = false;
            clang = false;
            ts = false;
            go = false;
          };
        }
      '';
      description = "Attribute set of neovim-ide preferences.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ set.neovim ];
  };
}
