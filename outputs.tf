output "docker_container_ip" {
  value = "${docker_container.hello-world.ip_address}"
}

output "bullshit" {
  value = "ha ha ha"
}
