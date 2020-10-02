#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, ... }:
{
  imports = [
    ../users ../shell ../ssh ../nix ../xdg
    ./networking ./git ./browser ./sound ./locale ./podman
  ];

  environment.systemPackages = with pkgs;
    [ mosh mpv qemu youtube-dl chromium ];
}
