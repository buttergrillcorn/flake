{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.qutebrowser = {
    enable = true;
    extraConfig = builtins.readFile ./config.py;
    settings = {
      url.start_pages = [ "file://${./startpage.html}" ];
      url.default_page = "file://${./startpage.html}";
      content.local_content_can_access_file_urls = true;
      content.local_content_can_access_remote_urls = true;
    };
  };
}
