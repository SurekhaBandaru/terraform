resource "aws_route53_record" "web" {
    count = length(var.instances)
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}" #mongodb.devopspract.site
    type = "A"
    ttl=1
    records = [aws_instance.roboshop[count.index].private_ip]
  
}