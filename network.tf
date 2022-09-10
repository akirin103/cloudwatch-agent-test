data "aws_availability_zones" "this" {
  state = "available"
}

module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  version        = "3.14.2"
  name           = "${var.system_name}-${var.env}-vpc"
  cidr           = "10.0.0.0/16"
  azs            = data.aws_availability_zones.this.names
  public_subnets = ["10.0.0.0/24"]
  tags           = local.tags
}
