#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ ... }:
{
  imports = [ ./allowUnfree.nix ];

  nix.autoOptimiseStore = true;
  nix.daemonNiceLevel = 2;
  nix.trustedUsers = [ "@wheel" ];
}
