{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/desktop.nix
    ./modules/services.nix
    ./modules/apps.nix
    ./modules/development.nix
    ./modules/terminal.nix
  ];
}
