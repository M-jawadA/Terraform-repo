provider "aws" {
  region     = "ap-south-1"
}

variable "subnet_cider_block" {
  description = "subnet cider block"
}

resource "aws_vpc" "developmen-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "development"
  }
}
resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.developmen-vpc.id
  cidr_block        = var.subnet_cider_block
  availability_zone = "ap-south-1a"
  tags = {
    Name = "development-subnet"
  }

}
# data "aws_vpc" "existing-vpc" {
#   default = true

# }

output "dev-vpc-id" {
  value = aws_vpc.developmen-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
