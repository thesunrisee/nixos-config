{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    kdePackages.kate
    cheese
    v4l-utils
    mpv
    onlyoffice-desktopeditors
    obsidian

    discord
    zoom-us
    obs-studio
    gimp
  ];
}
