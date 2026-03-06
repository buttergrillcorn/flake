{ pkgs, ... }:
{
  home.packages = [ pkgs.luakit ];

  xdg.configFile."luakit/userconf.lua".source = ./userconf.lua;
}
