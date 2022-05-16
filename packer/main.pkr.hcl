# vim: set filetype=hcl
build {
  name = "hatak"

  sources = [
    "sources.virtualbox-iso.ubuntu",
  ]

  provisioner "shell" {
    inline = ["sudo apt-get install -y ${join(" ", local.packages)}"]
  }

  provisioner "shell" {
    scripts = [
      "./scripts/configure_dotfiles.sh",
      "./scripts/install_docker.sh",
    ]
  }

  provisioner "file" {
    content     = "lorem ipsum\ndolor\nsit amet"
    destination = "/home/${local.username}/TEST"
  }
}
