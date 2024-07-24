variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default = "deft-smile-424908-e6"
}

variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "The zone where the resources will be created"
  type        = string
  default     = "us-east1-b"
}
variable "billing_ac_id" {
  description = "The billing account ID"
  type        = string
  default     = "014522-8945E4-43E38B"
}
