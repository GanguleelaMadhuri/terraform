resource "aws_lb" "ghost_nlb" {
name               = "ghost-nlb"
internal           = false
load_balancer_type = "network"
subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]

enable_deletion_protection = true

tags = {
    Environment = "production"
}
}
