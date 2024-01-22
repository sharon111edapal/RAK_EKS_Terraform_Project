# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {

  backend "s3" {
    bucket = "new-bucket-s3-terraform-backend"
    key    = "terraform-backend/terraform.tfstate"
    region = "ap-south-1"
    encrypt= true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }
  }

  required_version = "~> 1.3"
}

