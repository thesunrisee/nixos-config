{ config, pkgs, ... }:

{
  # Shell
  programs.fish.enable = true;

  # System-level terminal packages
  environment.systemPackages = with pkgs; [
    kitty
  ];

  # Terminal font
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
