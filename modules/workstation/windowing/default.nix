{ pkgs, ... }:
{
  imports = [ ./fonts.nix ];

  services.xserver.enable = true;
  services.xserver.layout = "gb";

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.gnome3.core-utilities.enable = false;

  programs.seahorse.enable = true;

  environment.systemPackages = with pkgs;
    let
      gnomePackages = with gnome3;
        [
          gnome-tweaks
          nautilus
          gvfs
        ];
    in
    [ flameshot ] ++ gnomePackages;
}
