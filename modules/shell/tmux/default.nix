#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, ... }:
{
  home-manager.users.hayden.home.file.".tmux.conf".text =
    (pkgs.callPackage ./config.nix {});

  environment.systemPackages = with pkgs; [ tmux ];
}
