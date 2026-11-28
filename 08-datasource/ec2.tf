resource "aws_instance" "data_source"{
    ami = data.aws_ami.ami_id.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.data_source.id]
    tags = {
        Name = "data_source"
    }
}

resource "aws_security_group" "data_source"{
    name        = "data_source_sg"
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

    tags = {
        Name = "data_source_sg"
    }
}