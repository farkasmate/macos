# vim: set filetype=hcl
build {
  name = "hatak"

  sources = [
    "sources.virtualbox-iso.ubuntu",
  ]

  provisioner "shell" {
    scripts = [
      "./scripts/add_apt_repos.sh",
      "./scripts/apt_upgrade.sh",
      "./scripts/configure_dotfiles.sh",
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get install --assume-yes ${join(" ", local.packages)}",
    ]
  }

  provisioner "file" {
    content     = "lorem ipsum\ndolor\nsit amet"
    destination = "/home/${local.username}/TEST"
  }
}
