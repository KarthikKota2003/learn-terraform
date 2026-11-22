resource "aws_instance" "web_server"{
    ami = "ami-0055977a6e828a4f4"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web_server_sg.id]
    tags = {
        Name = "terraform-ec2 server'
    }
}

resource "aws_security_group" "web_server_sg"{
    name        = "web_server_sg"
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
        Name = "terraform-ec2 server"
    }
}