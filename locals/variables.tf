variable "project" {
    default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "component" {
  default = "cart"
}

#here, we will face an error cause we must not use a variable inside another, so we need to go with locals
/* variable "final_name"{
    default = "${var.project}-${var.environment}-${var.component}"
} */

variable "common_tags" {
  default = {
    Project = "roboshop"
    Terraform= true
  }
}
