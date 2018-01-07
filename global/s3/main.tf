terraform {
  backend "s3" {
    bucket  = "tuar-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "tuar-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
