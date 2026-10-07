resource "docker_network" "edge" {
  provider = docker.mail_dmz_01
  name     = "edge"
}

resource "docker_network" "mail" {
  provider = docker.mail_dmz_01
  name     = "mail"
}

resource "docker_volume" "traefik_acme" {
  provider = docker.mail_dmz_01
  name     = "traefik-acme"
}

resource "docker_volume" "crowdsec_data" {
  provider = docker.mail_dmz_01
  name     = "crowdsec-data"
}

resource "docker_volume" "postfix_spool" {
  provider = docker.mail_dmz_01
  name     = "postfix-spool"
}

resource "docker_volume" "rspamd_data" {
  provider = docker.mail_dmz_01
  name     = "rspamd-data"
}

resource "docker_image" "traefik_01" {
  provider = docker.proxy_dmz_01
  name     = "traefik:3.1"
}

resource "docker_container" "traefik_01" {
  provider = docker.proxy_dmz_01
  name     = "traefik"
  image    = docker_image.traefik_01.image_id
  restart  = "always"

  networks_advanced {
    name = docker_network.edge.name
  }

  ports {
    internal = 80
    external = 80
  }

  ports {
    internal = 443
    external = 443
  }
}

resource "docker_image" "traefik_02" {
  provider = docker.proxy_dmz_02
  name     = "traefik:3.1"
}

resource "docker_container" "traefik_02" {
  provider = docker.proxy_dmz_02
  name     = "traefik"
  image    = docker_image.traefik_02.image_id
  restart  = "always"

  networks_advanced {
    name = docker_network.edge.name
  }

  ports {
    internal = 80
    external = 80
  }

  ports {
    internal = 443
    external = 443
  }
}

resource "docker_image" "crowdsec_01" {
  provider = docker.proxy_dmz_01
  name     = "crowdsecurity/crowdsec:latest"
}

resource "docker_container" "crowdsec_01" {
  provider = docker.proxy_dmz_01
  name     = "crowdsec"
  image    = docker_image.crowdsec_01.image_id
  restart  = "unless-stopped"

  networks_advanced {
    name = docker_network.edge.name
  }
}

resource "docker_image" "postfix_relay_01" {
  provider = docker.mail_dmz_01
  name     = "registry.example.com/postfix-relay:1.4"
}

resource "docker_container" "postfix_relay_01" {
  provider = docker.mail_dmz_01
  name     = "postfix-relay"
  image    = docker_image.postfix_relay_01.image_id
  restart  = "always"

  networks_advanced {
    name = docker_network.mail.name
  }

  ports {
    internal = 25
    external = 25
  }

  ports {
    internal = 587
    external = 587
  }
}

resource "docker_image" "rspamd_01" {
  provider = docker.mail_dmz_01
  name     = "rspamd/rspamd:3.9"
}

resource "docker_container" "rspamd_01" {
  provider = docker.mail_dmz_01
  name     = "rspamd"
  image    = docker_image.rspamd_01.image_id
  restart  = "always"

  networks_advanced {
    name = docker_network.mail.name
  }
}
