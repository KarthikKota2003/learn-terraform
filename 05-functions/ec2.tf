resource "aws_instance" "functions"{
    ami = var.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.functions.id]
    tags = merge(var.ec2_tags,{
        Name = "functions"
        Environment = "Non-Prod"
    })

}

# resource "aws_instance" "web_server1"{
#     ami = "ami-0055977a6e828a4f4"
#     instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.web_server_sg.id]
#     tags = {
#         Name = "terraform-ec2 server"
#     }
# }

resource "aws_security_group" "functions"{
    name        = "functions"
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

    tags = var.ec2_tags
}