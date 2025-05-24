variable "region" {
  type        = string
  description = "Enter AWS region (e.g., us-east-1)"
}

variable "instance_name" {
  type        = string
  description = "Enter instance name"
}

variable "selected_ami" {
    type        = string
    description = "Enter valid ami id for a specific region"
}