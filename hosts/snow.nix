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
      ../modules/nix/unstable.nix

      ../modules/workstation
      
      ../modules/hardware/cpu/amd.nix
      ../modules/hardware/bluetooth.nix
      ../modules/hardware/gpu/amdgpu.nix
      ../modules/hardware/ssd

      ../modules/misc/snow-traefik
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

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
 
  system.stateVersion = "20.09";
}

