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
      [ podman podman.man runc conmon slirp4netns ];

  home-manager.users.hayden.home.file.".config/containers/libpod.conf".text =
    ''
      runtime_path = ["${pkgs.runc}/bin/runc"]
      conman_path = ["${pkgs.conmon}/bin/conman"]
    '';

  home-manager.users.hayden.home.file.".config/containers/storage.conf".text =
    ''
      [storage]
      runroot = "/tmp/hayden"
    '';
}
