variable "ami_id"{
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "AMI ID of ec2 image"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
    description = "Instance type of ec2 server"

    validation{
        condition = contains(["t3.micro","t8i.micro","t3.small"],var.instance_type)
        error_message = "The instance type you selected is heavy"
    }
}

variable "environment"{
    default = "prod"
}

variable "ec2_tags"{
    type = map
    default = {
        Name = "roboshop-mongodb"
        Environment = "dev"
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