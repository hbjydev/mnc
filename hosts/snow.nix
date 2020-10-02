#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ config, pkgs, ... }:
{
  imports =
    [
      ../hardware-configuration.nix
      ../modules/workstation
      ../modules/hardware/ssd
      ../modules/hardware/cpu/amd.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "snow";
  networking.useDHCP = false;
  networking.interfaces.enp40s0.useDHCP = true;
  networking.interfaces.wlp39s0.useDHCP = true;

  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  time.timeZone = "Europe/London";

  hardware.enableRedistributableFirmware = true;

  services.xserver.enable = true;
  services.xserver.layout = "gb";

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  system.stateVersion = "20.09";
}

