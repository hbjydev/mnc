#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, ... }:
{
  imports = [
    ../users ../shell ../ssh ../nix
    ./networking ./git ./browser ./sound ./locale
    ./docker # ./podman
    ./terminal ./windowing
  ];

  environment.systemPackages = with pkgs;
    [
      mosh mpv qemu youtube-dl chromium
      xclip teams unstable.discord
      mariadb-client
    ];

  virtualisation.libvirtd = {
    enable = true;
  };
}
