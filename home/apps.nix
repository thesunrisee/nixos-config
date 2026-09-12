{ config, pkgs, ... }:

{
  # User-level apps
  home.packages = with pkgs; [
    btop
    fastfetch
    lazygit
    gh
  ];
}
