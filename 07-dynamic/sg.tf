resource "aws_security_group" "dynamic-demo"{
    name        = "dynamic-demo"
    description = "Allow all traffic to web server"

    dynamic "ingress" {
    for_each = var.ingress_rules
    content{
        from_port        = ingress.value.port_no
        to_port          = ingress.value.port_no
        protocol         = "tcp"
        cidr_blocks      = ingress.value.cidr_block
        }
    }
    
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "dynamic-demo"
    }
}