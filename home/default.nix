{ config, pkgs, ... }:

{
  home.username = "alharis";
  home.homeDirectory = "/home/alharis";

  home.stateVersion = "26.05";

  imports = [
    ./shell.nix
    ./editors.nix
    ./apps.nix
  ];

  # User-level environment
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.home-manager.enable = true;
}
