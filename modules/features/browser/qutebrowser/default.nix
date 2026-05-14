{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true;
    extraConfig = builtins.readFile ./config.py;
    settings = {
      url.start_pages = [ "file://${./startpage.html}" ];
      url.default_page = "file://${./startpage.html}";
      content.local_content_can_access_file_urls = true;
      content.local_content_can_access_remote_urls = true;
    };
    greasemonkey = [
      # Picture Viewer
      (pkgs.fetchurl {
        url = "https://hoothin.github.io/UserScripts/Picviewer%20CE+/dist.user.js";
        sha256 = "sha256-kvqJaffGmIMRktnChZfj4ZjIJZOVvBwZx/9Jz5+yFU8=";
      })
      # Sponsor Block
      (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/mchangrh/sb.js/main/docs/sb-loader.user.js";
        sha256 = "sha256-Y/On1rrQgqj5Zr9LazvUGIr67qZcwKLbn73odGRdsu8=";
      })
    ];
  };
}
