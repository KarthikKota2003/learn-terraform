variable "ingress_rules"{
    default = {
        ssh = {
            port_no = 22
            cidr_block = ["0.0.0.0/0"]
        }
        dns = {
            port_no = 53
            cidr_block = ["0.0.0.0/0"]
        }
        sql = {
            port_no = 3306
            cidr_block = ["0.0.0.0/0"]
        }
        http = {
            port_no = 8080
            cidr_block = ["0.0.0.0/0"]
        }
    }
}