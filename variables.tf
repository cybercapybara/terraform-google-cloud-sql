variable "project_id" {
  description = "ID of the project in which to create the instance."
  type        = string
}

variable "name" {
  description = "Name of the Cloud SQL instance."
  type        = string
}

variable "region" {
  description = "Region in which to create the instance."
  type        = string
}

variable "database_version" {
  description = "Database engine version, e.g. POSTGRES_15 or MYSQL_8_0."
  type        = string
  default     = "POSTGRES_15"
}

variable "tier" {
  description = "Machine tier for the instance, e.g. db-f1-micro or db-custom-2-7680."
  type        = string
  default     = "db-f1-micro"
}

variable "availability_type" {
  description = "Availability type: ZONAL or REGIONAL (regional enables high availability)."
  type        = string
  default     = "ZONAL"

  validation {
    condition     = contains(["ZONAL", "REGIONAL"], var.availability_type)
    error_message = "availability_type must be either ZONAL or REGIONAL."
  }
}

variable "disk_size" {
  description = "Data disk size in GB."
  type        = number
  default     = 10

  validation {
    condition     = var.disk_size >= 10
    error_message = "disk_size must be at least 10 GB."
  }
}

variable "deletion_protection" {
  description = "Whether the instance is protected from deletion."
  type        = bool
  default     = true
}

variable "user_labels" {
  description = "User labels applied to the instance."
  type        = map(string)
  default     = {}
}
