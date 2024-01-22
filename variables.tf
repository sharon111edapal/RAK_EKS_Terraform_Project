# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "Backend_S3_Bucket" {
  description = "new-bucket-s3-terraform-backend"
  type        = string
  default     = "ap-south-1"
}

variable "access_key" {
  type        = string
  default     = "AKIARPBDSAGB5OS4LCGJ"
  description = "Enter your AWS Access key"
}

variable "secret_key" {
  type        = string
  default     = "QrsJ5zSUImLI3+MwhNJBld3d4eQsaFGQDm38foUK"
  description = "Enter your AWS Private Access key"
}

variable "EC2_Key_Name" {
  type        = string
  default     = "sharon111edapal"
  description = "Enter Key Name"
}