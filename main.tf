data "aws_vpc" "main" {
    filter {
      name = "tag:Name"
      values = ["main"]
    }
}

resource "aws_subnet" "public1" {
    vpc_id            = data.aws_vpc.main.id
    availability_zone = "us-east-1a"
    cidr_block        = cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)
}