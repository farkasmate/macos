# vim: set filetype=hcl
locals {
  _base_packages = [
    "bash-completion",
    "ethtool",
    "git",
    "htop",
    "man-db",
    "manpages",
    "mc",
    "net-tools",
    "ntpdate",
    "openssh-server",
    "pwgen",
    "sudo",
    "tcpdump",
    "telnet",
    "tig",
    "wpasupplicant",
  ]
  _docker_packages = [
    "containerd.io",
    "docker-ce",
    "docker-ce-cli",
    "docker-compose-plugin",
  ]
  _dev_packages = [
    "build-essential",
    "libbz2-dev",
    "libssl-dev",
  ]
  _misc_packages = [
    "pass",
    "pass-extension-otp",
    "surf",
    "xsel",
    "zathura",
  ]
  _x_packages = [
    "autocutsel",
    "i3-wm",
    "i3status",
    "rxvt-unicode",
    "suckless-tools",
    "vlock",
    "x11-xserver-utils",
    "xfonts-terminus",
    "xinit",
    "xserver-xorg",
  ]
  _yubikey_packages = [
    "gnome-keyring",
    "gnupg",
    "pinentry-qt",
    "scdaemon",
  ]

  packages = sort(distinct(concat(
    local._base_packages,
    local._dev_packages,
    local._docker_packages,
    local._misc_packages,
    local._x_packages,
    local._yubikey_packages,
  )))

  hostname = "hatak"

  # NOTE: Hard coded in `cloud-init/user-data`
  username = "matefarkas"
}
