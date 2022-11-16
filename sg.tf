module "sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "devil-sg"
  description = "Security group for ghost with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
