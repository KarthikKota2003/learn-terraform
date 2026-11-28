resource "aws_instance" "provisioner-demo"{
    ami = "ami-0055977a6e828a4f4"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.provisioner-demo.id]
    tags = {
        Name = "provisioner-demo server"
    }

    # provisioner "local-exec"{
    #     command = "echo ${self.private_ip} > inventory.ini"
    # }

    # provisioner "local-exec"{
    #     when = "destroy"
    #     command = "rm -f inventory.ini"
    # }

    connection{
        type =  "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }

    provisioner "remote-exec"{
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",
            "sudo systemctl enable nginx"
            ]
    }
}


resource "aws_security_group" "provisioner-demo"{
    name        = "provisioner-demo_sg"
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
        Name = "provisioner-demo"
    }
}