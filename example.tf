resource "docker_container" "hello-world" {
  name = "foo"
  image = "${docker_image.hello-world.latest}"

  provisioner "local-exec" {
//    command = "./hello.sh"
    command = "echo hello!"
  }
}

resource "docker_image" "hello-world" {
  name = "hello-world:linux"
}
