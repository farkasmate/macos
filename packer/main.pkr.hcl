# vim: set filetype=hcl
build {
  name = "hatak"

  sources = [
    "sources.virtualbox-iso.ubuntu",
  ]

  provisioner "shell" {
    execute_command = "echo '${var.password}' | sudo -S bash -c '{{ .Vars }} {{ .Path }}'"
    scripts = [
      "./scripts/install_packages.sh",
    ]
  }

  provisioner "file" {
    content     = "lorem ipsum\ndolor\nsit amet"
    destination = "/home/${var.username}/TEST"
  }
}
