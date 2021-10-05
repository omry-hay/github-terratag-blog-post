variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "machine_type" {
  description = "The type of the VM you would like to create"
}

variable "region" {
  description = "The region where you want to deploy your infrastructure"
  default = "us-central1"
}

variable "zone" {
  description = "The zone where you want to deploy your infrastructure"
  default = "us-central1-c"
}
