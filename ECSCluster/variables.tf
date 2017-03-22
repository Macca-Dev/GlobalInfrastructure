variable "access" {}
variable "secret" {}
variable "env" {}
variable "app" {
    default = "global-ecs-cluster"
}
variable "asg-min" {
    default = 1
}
variable "asg-max" {
    default = 1
}
variable "asg-desired" {
    default = 1
}
variable "keypair" {
    type = "map"
    default = {
        uat = "ecs-cluster"
        prod = ""
    }
}
variable "iam-name-prefix" {
    default = "ecs-"
}
variable "region" {
    type = "map"
    default = {
        uat = "us-west-2"
        prod = "us-east-1"
    }
}