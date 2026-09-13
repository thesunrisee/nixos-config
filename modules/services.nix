{ config, pkgs, ... }:

{
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Power management
  services.power-profiles-daemon.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Printer + network discovery
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;

  # Flatpak
  services.flatpak.enable = true;

  # Containerization
  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;

  # Database
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  # Disk mount helper (auto-mount USB, dll.)
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    powertop
  ];
}
