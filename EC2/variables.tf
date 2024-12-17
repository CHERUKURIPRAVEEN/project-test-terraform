variable "profile" {
  type    = string
  default = "default"
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "instances" {
  type = map(object({
    ami           = string
    instance_type = string
    key_name      = string
  }))
  default = {
    instance1 = {
      ami           = "ami-04a81a99f5ec58529"
      instance_type = "t2.micro"
      key_name      = "management_key"
    }
    instance2 = {
      ami           = "ami-066784287e358dad1"
      instance_type = "t2.micro"
      key_name      = "management_key"
    }
    instance3 = {
      ami           = "ami-066784287e358dad1"
      instance_type = "t2.micro"
      key_name      = "management_key"
    }
  }

}