# vim: set filetype=hcl
source "virtualbox-iso" "ubuntu" {
  guest_os_type    = "Ubuntu_64"
  iso_url          = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  iso_checksum     = "sha256:84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
  vm_name          = "ubuntu-2204"
  format           = "ova"
  output_directory = "./output/"

  headless         = true
  shutdown_command = "sudo shutdown -P now"

  http_directory         = "./cloud-init/"
  boot_keygroup_interval = "500ms"
  boot_command = [
    "c",
    "linux /casper/vmlinuz ",
    "autoinstall ds='nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/' <enter>",
    "initrd /casper/initrd <enter>",
    "boot <enter>",
  ]

  ssh_username           = local.username
  ssh_timeout            = "30m"
  ssh_handshake_attempts = 1000
  ssh_agent_auth         = true

  gfx_controller = "vmsvga"
  gfx_vram_size  = "128"

  cpus                 = 2
  disk_size            = "102400"
  hard_drive_interface = "sata"
  memory               = 4096
}
