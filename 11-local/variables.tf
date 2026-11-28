variable "ami_id"{
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "AMI ID of ec2 image"
}

# variable "instance_type"{
#     type = string
#     # default = "t3.micro"
#     description = "Instance type of ec2 server"

# }

variable "Name"{
    default = "Locals"
}

variable "Environment"{
    default = "UAT"
}

variable "ec2_tags"{
    type = map
    default = {
        Name = "roboshop-dev"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "cidr"{
    type = list
    default = ["0.0.0.0/0"]
}

variable "ingress_port"{
    type = number
    default = 0

}

variable "egress_port"{
    type = number
    default = 0

}