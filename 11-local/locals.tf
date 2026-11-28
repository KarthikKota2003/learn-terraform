locals{
    instance_type = "t3.small"
    Name = "${var.Name}-${var.Environment}"
    ec2_tags = merge(var.ec2_tags,{
        Name = local.Name
    })
}