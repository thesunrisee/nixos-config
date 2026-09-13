{ config, pkgs, ... }:

{
  # User-level apps
  home.packages = with pkgs; [
    btop
    fastfetch
    lazygit
    gh
  ];

  # Spotify + Spicetify (theme/customizations via spicetify-nix)
  programs.spicetify = {
    enable = true;
  };
}
