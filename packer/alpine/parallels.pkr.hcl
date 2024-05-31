# vim: set filetype=hcl
source "parallels-iso" "alpine" {
  guest_os_type = "linux"
  iso_url       = "https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-standard-3.20.0-x86_64.iso"
  iso_checksum  = "sha256:b29000da345d73a6a6de5b8053e09255ac22dbb4cfac9cbc5ddf1bbb45871d65"

  vm_name          = local.hostname
  output_directory = "./output/"

  parallels_tools_mode = "disable"
  shutdown_command     = "poweroff"

  http_directory = "./config/"
  boot_wait = "30s"
  boot_command = [
    "root<enter>",
    "setup-alpine -q<enter><enter>",
    "ntpd -ndqp pool.ntp.org<enter>",
    "setup-alpine -f http://{{ .HTTPIP }}:{{ .HTTPPort }}/answer_file -e<enter>",
    "y<enter>",
    "setup-sshd -k https://github.com/farkasmate.keys openssh<enter>",
    #"reboot<enter>",
    #"openrc --service sshd stop<enter>",
    #"wget https://github.com/farkasmate.keys -O /root/.ssh/authorized_keys<enter>",
    ##"lbu add /root<enter>",
    ##"reboot<enter>",
  ]

  ssh_username           = "root"
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
