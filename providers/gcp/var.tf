variable "id_project" {
  description = "Enter a valid Project ID of your GCP Console"
  type = string
}

variable "instance_region" {
  description = "Name of the region (e.g. us-east1)"
  type = string
  #default = "us-east1"
}
variable "instance_name" {
  description = "Name of the Compute Engine instance (Name must consist of lowercase letters (a-z), numbers, and hyphens, Name must start with a lowercase letter)"
  type        = string
  #default     = "myinstance"
}

#variable "instance_type" {
 # description = "Machine type for the instance"
 # type        = string
 # default     = "e2-micro"
#}

variable "instance_zone" {
  description = "Zone where the instance will be deployed (eg. us-east1-b)"
  type        = string
  #default     = "us-east1-c"
}

variable "name_image" {
  description = "Enter valid Image name: eg. ubuntu-os-cloud/ubuntu-2004-lts (Image_Project/Image_family)"
  type        = string
  #default     = "ubuntu-2004-focal-arm64-v20250508a"
}

