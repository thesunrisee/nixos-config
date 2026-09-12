{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    powertop
    brave
    kdePackages.kate
    cheese
    v4l-utils
    mpv
    onlyoffice-desktopeditors
    obsidian
  ];
}
