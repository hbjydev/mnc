#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in

{
  "coc-phpls" = buildVimPlugin {
    name = "coc-phpls";
    src = fetchgit {
      url = "https://github.com/marlonfan/coc-phpls";
      rev = "03c8ebea89815fb33ac0c1d1708ed3750b584fd7";
      sha256 = "0k4zhbyapgrh6h39ihwkky76i2frvsr1y1x5s5hbkpdac4h8i921";
    };
    dependencies = [ pkgs.vimPlugins.coc-nvim ];
  };
}
