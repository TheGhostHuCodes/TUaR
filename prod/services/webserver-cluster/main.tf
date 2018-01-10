terraform {
  backend "s3" {
    bucket  = "tuar-state"
    key     = "prod/services/webserver-cluster/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "tuar-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type      = "t2.micro"
  min_size           = 3
  max_size           = 10
  enable_autoscaling = true
}
