{ config, lib, ... }:
lib.mkAfter ''
  * {
    border: none;
    font-family: JetBrainsMono Nerd Font;
    font-weight: bold;
    font-size: 14px;
    border-radius: 0;
    min-height: 0;
  }

  window#waybar {
    background: ${config.lib.stylix.colors.withHashtag.base00};
    color: ${config.lib.stylix.colors.withHashtag.base05};
  }

  /* --- All --- */
  label {
    all: unset;
  }


  #idle_inhibitor,
  #privacy,
  #clock,
  #cpu,
  #memory,
  #network,
  #bluetooth,
  #wireplumber,
  #backlight,
  #custom-battery,
  #custom-notification,
  #tray {
    margin: 0 10px;
    min-width: 25px;
    transition: all 0.3s ease;
    background: transparent;
    color: ${config.lib.stylix.colors.withHashtag.base05};
  }

  #tooltip {
  }

  #tooltip label {

  }

  .modules-left {
  }

  #idle_inhibitor {
  }

  #idle_inhibitor.activated {

  }

  #workspaces {
    margin-left: -5px;
  }

  #workspaces button {
    padding: 0 5px;
    margin: 0 5px;
    color: ${config.lib.stylix.colors.withHashtag.base05};
  }

  #workspaces button.focused {
  }

  #workspaces button.active {
  }

  #workspaces button.special {
  }

  #workspaces button.urgent {
    border-bottom: 0px;
    color: ${config.lib.stylix.colors.withHashtag.base08};
  }

  #workspaces button:hover {

  }

  #workspace button.empty {
    opacity: 0.5;
  }

  #privacy {
  }

  #clock {
    background: transparent;
    color: ${config.lib.stylix.colors.withHashtag.base05};
  }

  /* --- Right --- */
  .modules-right {
  } 

  #custom-expand-icon {
    padding: 0 10px;
    margin: 0 5px;
  }

  #tray {
  }

  #custom-battery {
  }
''
