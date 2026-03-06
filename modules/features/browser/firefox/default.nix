{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      # Replace with your actual profile name, often "default"
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        /* Square off all UI elements */
        :root {
            --tab-border-radius: 0px !important;
            --arrowpanel-border-radius: 0px !important;
            --toolbarbutton-border-radius: 0px !important;
            --urlbar-border-radius: 0px !important;
            --border-radius-medium: 0px !important;
            --border-radius-small: 0px !important;
        }
        #urlbar-background, #searchbar {
            border-radius: 0px !important;
        }
      '';
      userContent = ''
        /* Globally remove border radius from all website elements */
        * {
            border-radius: 0px !important;
        }
      '';
    };
  };

}
