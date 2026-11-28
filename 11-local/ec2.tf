resource "aws_instance" "locals-demo"{
    ami = var.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.locals-demo.id]
    tags = local.ec2_tags

}

resource "aws_security_group" "locals-demo"{
    name        = "locals-demo-sg"
    description = "Allow all traffic to web server"

    ingress {
    from_port        = var.ingress_port
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr
    }
    
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr
    }

    tags = local.ec2_tags
}