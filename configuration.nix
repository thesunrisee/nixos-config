{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/desktop.nix
    ./modules/packages.nix
    ./modules/development.nix
    ./modules/terminal.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 2;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.power-profiles-daemon.enable = true;

  users.users.alharis = {
    isNormalUser = true;
    description = "alharis";

    shell = pkgs.fish;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  zramSwap = {
    enable = true;
    memoryPercent = 25;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  nix.optimise.automatic = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.firewall.enable = true;

  system.stateVersion = "26.05";
}
