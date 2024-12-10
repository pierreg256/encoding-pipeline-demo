variable "env" {
  description = "The environment name"
  type        = string
  default     = "dev"
}

variable "prefix" {
  description = "The prefix for naming resources"
  type        = string
  default     = "epdemo"
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "France Central"
}
