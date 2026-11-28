resource "aws_instance" "tf-state"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.tf-state.id]
    tags = var.ec2_tags
}


resource "aws_security_group" "tf-state"{
    name        = "tf-state-demo_sg"
    description = "Allow all traffic to web server"

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = var.ec2_tags

    lifecycle{
        create_before_destroy = true
    }
}