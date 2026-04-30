variable "vpc_config" {
  description = "To get CIDR block and name from the user"
  type = object({
    CIDR_block = string
    Name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.CIDR_block))
    error_message = "The CIDR block must be in the format 'x.x.x.x/x'."
  }
}

variable "subnet_config" {
  description = "To get CIDR block and availability zone"
  type = map(object({
    CIDR_block = string
    az         = string
    public     = optional(bool, false)
  }))

  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.CIDR_block))])
    error_message = "The CIDR block must be in the format 'x.x.x.x/x'."
  }
}
