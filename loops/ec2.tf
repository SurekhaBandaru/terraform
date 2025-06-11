
resource "aws_instance" "roboshop" {
    count = length(var.instances)
    ami             = var.ami_id #ami_id in variable.tf
    instance_type   = var.environment == "dev" ? "t3.micro":"t3.small"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    
    tags = {
    Name = var.instances[count.index]
    }

}

resource "aws_security_group" "allow_all" {
    name        =  var.sg_name
    description =  var.sg_description

    ingress {
        from_port=var.from_port
        to_port=var.to_port
        protocol=var.protocol
        cidr_blocks=var.cidr_blocks
        ipv6_cidr_blocks=var.ipv6_cidr_blocks

    }
    egress {
        from_port=var.from_port
        to_port=var.to_port
        protocol=var.protocol
        cidr_blocks=var.cidr_blocks
        ipv6_cidr_blocks=var.ipv6_cidr_blocks

    }

    tags= var.sg_tags
}