# vim: set filetype=hcl
variable "password" {
  description = "Password of the user"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "Username of the user"
  type        = string
}
