{ config, ... }:
''
  * {
    border: none;
    font-family: JetBrainsMono Nerd Font;
    font-weight: bold;
    font-size: 14px;
    border-radius: 0;
    min-height: 0;
  }

  window#waybar {
    background: transparent;
    color: #f2f2f2;
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
  #tray {
    margin: 0 10px;
    min-width: 25px;
    transition: all 0.3s ease;
    background: transparent;
    color: #f2f2f2;
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
    color: #f2f2f2;
  }

  #workspaces button.active {

  }

  #workspaces button.special {

  }

  #workspaces button.urgent {
    color: #f5c2e7
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
    color: #f2f2f2;
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
