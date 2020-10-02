#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
with import <nixpkgs> {};

pkgs.neovim.override {
  viAlias = true;
  vimAlias = true;

  withNodeJs = true;
  withPython = true;
  withPython3 = true;

#  [ pkgs.python3 pkgs.fzf pkgs.ripgrep pkgs.universal-ctags ]

  configure = (import ./customization.nix { pkgs = pkgs; });
}
