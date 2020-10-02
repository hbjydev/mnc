#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, lib, config, ... }:

{
  programs.chromium = {
    enable = true;

    homepageLocation = "https://itshayden.dev";

    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "bmnlcjabgnpnenekpadlanbbkooimhnj" # honey
      "hepbieccgbieoeaigepkojmogpkjfpin" # pip everywhere

      "kljmejbpilkadikecejccebmccagifhl" # saucenao
    ];

    extraOpts = {
      "PasswordManagerEnabled" = false;
    };
  };

  environment.systemPackages = [ pkgs.chromium ];
}

