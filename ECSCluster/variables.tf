variable "access" {}
variable "secret" {}
variable "env" {}
variable "app" {
    default = "global_ecs_cluster"
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
variable "keypair-name" {
    default = ""
}