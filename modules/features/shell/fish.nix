{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nhos = "nh os switch";
      nhhs = "nh home switch";
    };
    shellAliases = {
      c = "clear";
      cat = "bat";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
      set -gx DIRENV_LOG_FORMAT ""
      set -Ux fifc_editor "emacs"
    '';
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "fifc";
        src = pkgs.fishPlugins.fifc.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];
  };
}
