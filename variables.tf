# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
}


variable "access_key" {
  type        = string
  description = "Enter your AWS Access key"
}

variable "secret_key" {
  type        = string
  description = "Enter your AWS Private Access key"
}

variable "EC2_Key_Name" {
  type        = string
  description = "Enter Key Name"
}