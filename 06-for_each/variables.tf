variable "ami_id"{
    default = "ami-0055977a6e828a4f4"
}

variable "instance_type"{
    default = "t3.micro"
}

variable "environment"{
    default = "dev"
}

# variable "instances"{
#     type = list 
#     default = ["mongodb","redis","rabbitmq","mysql","catalogue","cart","user","shipping","payment","frontend"]
# }

variable "instances"{
    default = {
        mongodb = {
            instance_type = "t3.micro"
            port_no = 27017
        }
        redis = {
            instance_type = "t3.micro"
            port_no = 6379
        }
        mysql = {
            instance_type = "t3.micro"
            port_no = 3306
        }
        rabbitmq = {
            instance_type = "t3.micro"
            port_no = 5672
        }
        catalogue = {
            instance_type = "t3.micro"
            port_no = 8080
        }
        cart = {
            instance_type = "t3.micro"
            port_no = 8080
        }
        user = {
            instance_type = "t3.micro"
            port_no = 8080
        }
        shipping = {
            instance_type = "t3.micro"
            port_no = 8080
        }
        payment = {
            instance_type = "t3.micro"
            port_no = 8080
        }
        frontend = {
            instance_type = "t3.micro"
            port_no = 80
        }
    }
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