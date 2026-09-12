{ config, pkgs, ... }:

{
  # Fish binary for login shell (config handled by home-manager)
  programs.fish.enable = true;

  # Terminal font
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
