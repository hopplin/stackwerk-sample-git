resource "docker_network" "ci" {
  provider = docker.tools_lab_01
  name     = "ci"
}

resource "docker_volume" "runner_config" {
  provider = docker.tools_lab_01
  name     = "runner-config"
}

resource "docker_volume" "registry_data" {
  provider = docker.tools_lab_01
  name     = "registry-data"
}

resource "docker_image" "gitlab_runner_01" {
  provider = docker.tools_lab_01
  name     = "gitlab/gitlab-runner:latest"
}

resource "docker_container" "gitlab_runner_01" {
  provider = docker.tools_lab_01
  name     = "gitlab-runner"
  image    = docker_image.gitlab_runner_01.image_id
  restart  = "always"

  networks_advanced {
    name = docker_network.ci.name
  }
}

resource "docker_image" "registry_02" {
  provider = docker.tools_lab_02
  name     = "registry:2"
}

resource "docker_container" "registry_02" {
  provider = docker.tools_lab_02
  name     = "registry"
  image    = docker_image.registry_02.image_id
  restart  = "always"

  networks_advanced {
    name = docker_network.ci.name
  }

  ports {
    internal = 5000
    external = 5000
  }
}
