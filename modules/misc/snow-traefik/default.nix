{ ... }:
{
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers."traefik" = {
    image = "traefik";
    autoStart = true;
    volumes = [
      "${./config}/traefik.yml:/etc/traefik/traefik.yml"
      "${./config}/acme.json:/etc/traefik/acme.json"
    ];
    ports = [ "80:80" "443:443" ];

    extraOptions = [ "--network=traefik" ];
  };
}
