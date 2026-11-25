variable "ami_id"{
    default = "ami-0055977a6e828a4f4"
}

variable "instance_type"{
    default = "t3.micro"
}

variable "environment"{
    default = "dev"
}

variable "instances"{
    type = list 
    default = ["mongodb","redis","rabbitmq","mysql","catalogue","cart","user","shipping","payment","frontend"]
}

variable "project"{
    default = "roboshop"
}

variable "zone_id"{
    default = "Z055771213OK2D1UJZPAE"
}

variable "domain"{
    default = "kartheekops92.online"
}