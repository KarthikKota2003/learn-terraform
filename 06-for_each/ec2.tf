resource "aws_instance" "roboshop"{
    # count = 10
    # count = length(var.instances)
    for_each = var.instances
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [
        aws_security_group.common.id,
        aws_security_group.roboshop[each.key].id
        ]
    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}

resource "aws_security_group" "common"{
    name        = "${var.project}-${var.environment}-common"
    description = "Common SG for all servers"

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
        Name = "${var.project}-${var.environment}-common"
    }
}

resource "aws_security_group" "roboshop"{
    # count = 10
    # count = length(var.instances)
    for_each = var.instances
    name        = "${var.project}-${var.environment}-${each.key}"
    description = "Allow traffic to instance of roboshop"

    ingress {
    from_port        = each.value.port_no
    to_port          = each.value.port_no
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}