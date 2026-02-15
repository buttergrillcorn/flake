{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;
  users.users.james.shell = pkgs.fish;

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
