#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ lib, pkgs, config, ... }:
let
  inherit (lib) filterAttrs mapAttrsToList mkOption;
  inherit (lib.types) loaOf attrsOf path submodule;
  inherit (pkgs) linkFarm;

  userOptions = {
    options.xdg.config.paths = mkOption {
      default = {};
      type = attrsOf path;
    };
  };

in
{
  options = {
    users.users = mkOption {
      type = loaOf (submodule userOptions);
    };
  };

  config = {
    environment.etc."xdg/nixos/per-user".source =
      linkFarm "xdg-config-users"
                (mapAttrsToList (user: { xdg, ... }: {
                  name = user;
                  path = linkFarm "${user}-xdg-config-home"
                                  (mapAttrsToList
                                    (name: path: { inherit name path; })
                                    xdg.config.paths);
                }) (filterAttrs (_: { xdg, ... }: xdg.config.paths != {})
                                config.users.users));

    environment.sessionVariables = {
      XDG_CONFIG_HOME = "/run/current-system/etc/xdg/nixos/per-user/$USER";
      XDG_DATA_HOME = "$HOME/state";
      XDG_CACHE_HOME = "$HOME/state/cache";
    };
  };
}
