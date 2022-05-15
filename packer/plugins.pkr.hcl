# vim: set filetype=hcl
packer {
  required_version = "~> 1.8"
  required_plugins {
    virtualbox = {
      version = "~> 1.0"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}
