variable "location" {
  description = "Azure region for platform resources"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for Azure resource naming"
  type        = string
  default     = "golden-path"
}