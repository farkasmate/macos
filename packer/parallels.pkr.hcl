# vim: set filetype=hcl
source "parallels-iso" "ubuntu" {
  guest_os_type = "ubuntu"
  iso_url       = "https://releases.ubuntu.com/24.04/ubuntu-24.04-live-server-amd64.iso"
  iso_checksum  = "sha256:8762f7e74e4d64d72fceb5f70682e6b069932deedb4949c6975d0f0fe0a91be3"

  vm_name          = local.hostname
  output_directory = "./output/"

  parallels_tools_mode = "disable"
  shutdown_command     = "sudo shutdown -P now"

  http_directory = "./cloud-init/"
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

  cpus                 = 2
  disk_size            = "51200"
  disk_type            = "plain"
  skip_compaction      = true
  hard_drive_interface = "sata"
  memory               = 4096

  prlctl = [
    [
      "set", "{{.Name}}",
      "--auto-switch-fullscreen", "off",
      "--high-resolution", "on",
      "--modality-stay-on-top", "off",
      "--shared-clipboard", "on",
      "--shf-host-add", "${local.hostname}", "--path", "/Users/${local.username}/${local.hostname}/", "--mode", "rw", "--enable",
      "--sync-host-printers", "off",
    ],
  ]

  prlctl_post = [
    [
      "set", "{{.Name}}",
      "--autostart", "off",
      "--on-window-close", "suspend",
      "--pause-idle", "on",
      "--startup-view", "same",
    ],
  ]
}
