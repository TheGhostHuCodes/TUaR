terraform {
  backend "s3" {
    bucket  = "tuar-state"
    key     = "stage/data-stores/mysql/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-2"
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"

  allocated_storage = 10
  instance_class    = "db.t2.micro"
  db_name           = "example_database"
  db_username       = "admin"
  db_password       = "${var.db_password}"
}
