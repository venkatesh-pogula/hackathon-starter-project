variable "vpc_cidr" {
    type = string
    default = "10.10.0.0/16"
}

variable "vpc_tags" {
    type = string
    default = "Vpc_1"
}

variable "subnet_cidr" {
    type = list(string)
    default = [ "10.10.1.0/24" , "10.10.2.0/24" , "10.10.3.0/24"]
}

variable "subnet_az" {
    type = list(string)
    default = [ "us-west-2a" , "us-west-2b" , "us-west-2c"]
}

variable "subnet_tags" {
    type = list(string)
    default = [ "app_subnet" , "app_sunet2" , "app_subnet3" ]
}

variable "app_index" {
    type = list(number)
    default = [ 0,1,2 ]
}

variable "Ec2_instance_tags" {
    type = list(string)
    default = [ "dev" ,"QA" ]
}

variable "ec2_emi_id" {
    type = string
    default = "ami-017fecd1353bcc96e"
}

variable "ec2_type" {
    type = string
    default = "t2.micro"
  
}
variable "ec2_index" {
    type = list(number)
    default = [ 0,1 ]
}

variable "ec2_tags_index" {
    type = list(number)
    default = [ 0,1 ]
  
}



