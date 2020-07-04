variable cloud_id {
  description = "Cloud"
}

variable folder_id {
  description = "Folder"
}

variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable image_id {
  description = "Image"
}

variable subnet_id {
  description = "Subnet"
}

variable service_account_key_file {
  description = "SA key file"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable counts {
  description = "Count of instances"
  default     = 1
}
