#  _   ___  __
# | |_| \ \/ / mnc -- (c) Hayden Young 2020
# |  _  |\  /  https://github.com/itshaydendev/mnc
# |_| |_|/_/   https://itshayden.dev
#
{ pkgs, ... }:
{
  environment.etc."containers/libpod.conf".text = ''
    runtime_path = ["${pkgs.runc}/bin/runc"]
    conmon_path = ["${pkgs.conmon}/bin/conmon"]
  '';

  environment.etc."containers/policy.json".text = builtins.toJSON {
    default = [ { type = "insecureAcceptAnything"; } ];
  };

  environment.etc."containers/registries.conf".text = ''
    [registries.search]
    registries = ['docker.io']
  '';

  environment.systemPackages = with pkgs;
    let
      podman-bin = writeShellScriptBin "podman" ''
        HOME="$HOME/podman"
        exec ${podman}/bin/podman "$@"
      '';
    in
      [ podman-bin podman.man runc conmon slirp4netns ];

  users.users.hayden.xdg.config.paths."podman/.config/containers/libpod.conf" =
    pkgs.writeText "libpod.conf" ''
      runtime_path = ["${pkgs.runc}/bin/runc"]
      conman_path = ["${pkgs.conmon}/bin/conman"]
    '';

  users.users.hayden.xdg.config.paths."podman/.config/containers/storage.conf" =
    pkgs.writeText "storage.conf" ''
      [storage]
      runroot = "/tmp/hayden"
    '';
}
