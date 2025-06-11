
resource "aws_instance" "roboshop" {

  # for_each = var.instances # if we change instances variable to list form map, we need to convert list to set/map to use for each loop
  for_each = toset(var.instances)
  ami      = var.ami_id #ami_id in variable.tf
  #in the above, we converted to set, so there will be no each.value
  #instance_type   = each.value
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = each.key
  }

}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
  #here just add dynamic before the block to be iterated
  #and calll required variable into for_each
  #within content, where we need to load (iterate) dynamic data there call with "ingress (this block name)" and pass the variable names as shown
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = var.protocol
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }

  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks

  }

  tags = var.sg_tags
}