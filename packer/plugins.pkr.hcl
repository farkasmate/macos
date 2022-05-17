# vim: set filetype=hcl
packer {
  required_version = "~> 1.8"
  required_plugins {
    git = {
      version = "~> 0.3"
      source  = "github.com/ethanmdavidson/git"
    }
    virtualbox = {
      version = "~> 1.0"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}
