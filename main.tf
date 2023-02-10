resource "aws_vpc" "vpc_creation" {
    cidr_block = var.vpc_cidr
    tags = {
      "Name" = var.vpc_tags
    }
}
resource "aws_subnet" "creating_subnets" {
   count = 3
   cidr_block = var.subnet_cidr[count.index]
   availability_zone = var.subnet_az[count.index]
   tags = {
     "Name" = var.subnet_tags[count.index]
   }
   vpc_id = aws_vpc.vpc_creation.id
}
resource "aws_internet_gateway" "igw_vpc" {
    vpc_id = aws_vpc.vpc_creation.id

    tags = {
      "Name" = "vpc_internetgateway"
    }
}
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc_creation.id
  route = [ ]
  tags = {
    "Name" = "route_public"
  }
}
resource "aws_route" "publicroute" {
    route_table_id = aws_route_table.public_route.id
    destination_cidr_block = "0.0.0.0/16"
    gateway_id = aws_internet_gateway.igw_vpc.id
}
resource "aws_route_table_association" "public_assicate" {
  count = length(var.app_index)
  subnet_id = aws_subnet.creating_subnets[var.app_index[count.index]].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_security_group" "websg" {
  name = "openhttp"
  description = "Open http and ssh"
  vpc_id = aws_vpc.vpc_creation.id

  tags = {
    "Name" = "Openhttp"
  }

}

resource "aws_security_group_rule" "websghttp" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.websg.id
}

resource "aws_security_group_rule" "websgssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.websg.id
}

resource "aws_instance" "test_server" {

  ami = var.ec2_emi_id
  instance_type = var.ec2_type
  vpc_security_group_ids = [aws_security_group.websg.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.creating_subnets[0].id
  
    connection {
      user = "ubuntu"
      type = "ssh"
      private_key = "project"
      ##host = 
      provisioner "remote-exe" {
        
      
      }
    }
  
   tags = {
     count = length(var.ec2_tags_index)
     Name = aws_instance.test_server[var.Ec2_instance_tags[var.ec2_tags_index[count.index]]].id
   }
}
