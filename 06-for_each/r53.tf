resource "aws_route53_record" "roboshop" {  
    # count = 10
    # count = length(var.instances)
    for_each = aws_instance.roboshop
    allow_overwrite = true
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain}"
    type    = "A"
    ttl     = "1"
    records = [each.value.private_ip]
}

resource "aws_route53_record" "frontend"{
    count = contains(keys(var.instances),"frontend") ? 1 : 0
    allow_overwrite = true
    zone_id = var.zone_id
    name = "${var.domain}"
    type = "A"
    ttl = "1"
    records = [aws_instance.roboshop["frontend"].public_ip]
}