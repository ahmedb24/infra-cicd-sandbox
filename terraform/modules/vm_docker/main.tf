resource "docker_image" "vm" {
  name         = var.image
  keep_locally = true
}

resource "docker_container" "vm" {
  name    = var.name
  image   = docker_image.vm.image_id
  restart = "unless-stopped"
  command = var.command

  memory     = var.memory_mb
  cpu_shares = var.cpu * 1024
}
