#file can be anything.tf
variable "ami_id" {
  type        = string
  default = "ami-09c813fb71547fc4f"
  description = "AMI ID of Redhat 9"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "EC2 instance type"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name  = "Roboshop",
    Purpose = "EC2 instance name"
    
  }
}

#here, nothing was fixed as value, just given for testing purpose
variable "instances" {
  # default = {
  #   mongodb = "t3.micro"
  #   redis = "t3.micro"
  #   mysql = "t3.small" # mysql uses more resources when compared to others
  #   rabbitmq = "t3.micro"

  # }

  default = ["mongodb", "redis", "mysql", "rabbitmq"]

}

variable "sg_name" {
  type = string
  default = "allow_all"
  description = "Security group name"
  
}

variable "sg_description" {
  type = string
  default = "Allow all in and out traffic"
  description = "Description of security group"
  
}

variable "from_port" {
  type = number
  default = 0
  description = "From port value"
}

variable "to_port" {
  type = number
  default = 0
  description = "To port value"
}

variable "protocol" {
  type = string
  default = "-1"
  description = "protocol info"
  
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  type = list(string)
  default = ["::/0"]
}

variable "sg_tags" {
  type = map(string)
  default = {
    Name = "allow_all"
  }
}

variable "environment" {
    default = "dev"
  }


variable "zone_id" {
  default = "Z04486643GN3RHKI6IXZK"
}

variable "domain_name" {
  default = "devopspract.site"
}