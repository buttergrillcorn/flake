{ inputs, lib, config, pkgs, ... }:

{

  programs.waybar.style = ''
    * {
        border: none;
        border-radius: 0;
        font-family: JetBrainsMono Nerd Font;
        font-weight: Bold;
        font-size: 14px;
        min-height: 0;
    }

    /* Colors */
    @define-color 0 #202020;
    @define-color 1 #606060;
    @define-color 2 #9f9f9f;
    @define-color 3 #dfdfdf;

    window#waybar {
        background: @0;
        color: @2;
        border: solid 2px @1;
    }

    tooltip {
        background: @1;
        border: 2px solid @2;
        color: @2
    }

    tooltip label {
        color: @2;
    }

    #workspaces {
        background-color: @0;
        border-top: solid 2px;
        border-top-color: @1;
        border-bottom: solid 2px;
        border-bottom-color: @1;
    }

    #workspaces button {
        min-width: 25px;
        padding: 4px;
        background-color: @0;
        color: @2;
    }


    #workspaces button.active {
        background: @2;
        color: @0;
    }

    #submap {
        padding-left: 10px;
        padding-right: 15px;
        background: @2;
        color: @0;
        border-top: solid 2px;
        border-bottom: solid 2px;
        border-left: solid 2px;
        border-color: @1;
    }

    #clock {
        background-color: @2;
        color: @0;
        padding: 0 15px;
        border-top: solid 2px;
        border-bottom: solid 2px;
        border-right: solid 2px;
        border-color: @1;
    }

    #idle_inhibitor {
        padding-left: 10px;
        padding-right: 15px;
        background-color: @1;
        color: @0;
    }

    #tray {
        padding-right: 10px;
    }

    #pulseaudio {
        padding-left: 12px;
    }

    #pulseaudio-slider {
        margin-left: 0;
        padding-right: 20px;
    }

    #pulseaudio-slider slider {
        min-height: 1px;
        min-width: 1px;
        border: none;
        border-radius: 25px;
        box-shadow: none;
        background-color: @2;
        color: @2;
    }

    #pulseaudio-slider trough {
        min-height: 2px;
        min-width: 50px;
        background-color: @1;
    }

    #pulseaudio-slider highlight {
        min-height: 2px;
        min-width: 50px;
        background-color: @1;
    }

    #custom-scratchpad {
        padding-left: 10px;
    }

    #tray {
        color: @1;
    }

    #battery {
        padding-right: 20px;
    }

  ''

}
