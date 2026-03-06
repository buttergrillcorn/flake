{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./qutebrowser
    ./firefox
  ];
}
