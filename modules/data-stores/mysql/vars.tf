variable "db_name" {
  description = "The name of the database"
}

variable "db_username" {
  description = "The username for the database"
}

variable "db_password" {
  description = "The password for the database"
}

variable "instance_class" {
  description = "The class of EC2 Instance to run the database on (e.g. db.t2.micro)"
}

variable "allocated_storage" {
  description = "The size of the database in GB"
}
