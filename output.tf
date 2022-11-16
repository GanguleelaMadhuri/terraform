output "sg" {
  value = module.sg.security_group_name
}

output "asg-min" {
    value = module.asg.autoscaling_group_min_size
}

output "asg-max" {
    value = module.asg.autoscaling_group_max_size
}

output "asg-desired" {
    value = module.asg.autoscaling_group_desired_capacity
}
