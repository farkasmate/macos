# vim: set filetype=hcl
build {
  name = local.hostname

  sources = [
    "sources.parallels-iso.alpine",
  ]

  provisioner "shell" {
    inline = [
      "reboot",
      "touch /WIN",
    ]
  }

#  provisioner "shell" {
#    scripts = [
#      "./scripts/add_apt_repos.sh",
#      "./scripts/apt_upgrade.sh",
#      "./scripts/configure_dotfiles.sh",
#      "./scripts/set_issue.sh",
#    ]
#  }
#
#  provisioner "shell" {
#    inline = [
#      # Install packages
#      "sudo apt-get install --assume-yes ${join(" ", local.packages)}",
#
#      # Set hostname
#      "echo '${local.hostname}' | sudo tee /etc/hostname",
#      "sudo hostname -F /etc/hostname",
#    ]
#  }
#
#  provisioner "shell" {
#    scripts = [
#      "./scripts/install_non_deb_packages.sh",
#    ]
#  }
}
