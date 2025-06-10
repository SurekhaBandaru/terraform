resource "aws_route53_record" "www" {
    for_each = aws_instance.roboshop 
    # iterating through roboshop output, here output will come like map(map) eg: {"mongodb"={private_ip=23.22.44.21, public_ip etc}, "redis"={private_ip=23.43.32.23, public_ip etc}}
    zone_id = var.zone_id
    name = "${each.key}.${var.domain_name}" #mongodb.devopspract.site
    type = "A"
    ttl=1
    records = [each.value.private_ip]
  
}

