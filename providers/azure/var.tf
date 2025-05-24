variable "region" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "instance_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM - do not use Special symbol"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM - pass should be more than 6 character, use strong password uppercase, lowercase, numeric value, use special character"
  type        = string
  sensitive   = true
}
