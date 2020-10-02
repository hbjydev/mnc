#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, config, ... }:
{
  services.resolved.enable = true;

  networking.domain = "hbjy.dev";
  networking.hosts = with config.networking;
    { "127.0.1.1" = [ "${hostName}.${domain}" ]; };

  networking.networkmanager.enable = true;

  users.users.hayden.extraGroups = [ "networkmanager" ];

  networking.nameservers = [ "::1" ];

  programs.mtr.enable = true;
}
