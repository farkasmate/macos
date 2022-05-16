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
    "sudo",
    "tcpdump",
    "telnet",
    "tig",
    "wpasupplicant",
  ]
  _misc_packages = [
    "surf",
    "xsel",
    "zathura",
  ]
  _x_packages = [
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
    local._misc_packages,
    local._x_packages,
    local._yubikey_packages,
  )))

  username = "matefarkas"
}
