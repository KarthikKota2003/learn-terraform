variable "ami_id"{
    default = "ami-0055977a6e828a4f4"
}

variable "instance_type"{
    default = "t3.small"
}

variable "ec2_tags"{
    default = {
        Name = "tf-state"
        Environment = "prod"
    }
}