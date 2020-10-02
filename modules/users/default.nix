#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, lib, ... }:
let
  mkDefault = lib.mkOverride ((lib.mkDefault null).priority - 1);
in
{
  users.mutableUsers = false;

  users.groups.hayden = {};
  users.users.hayden = {
    description = "Hayden Young";

    hashedPassword = "$6$IKhjJ9tAFw$frZ2BPZ6tOmRCC643a11lgTWTBWWDYkeJmPGwcCn8tpNoiff6i4K4omyBtqUHmHPpG17P7WEVpwnaTeOH4Rr50";

    createHome = true;
    home = mkDefault "/home/hayden";

    uid = mkDefault 1000;
    subUidRanges = [ { count = 65536; startUid = 100000; } ];
    subGidRanges = [ { count = 65536; startGid = 100000; } ];

    group = "hayden";
    extraGroups = [ "wheel" ];

    shell = lib.mkDefault pkgs.bash;
  };
}
