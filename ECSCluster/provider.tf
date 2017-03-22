provider "aws" {
  access_key = "${var.access}"
  secret_key = "${var.secret}"
  region     = "${lookup(var.region, var.env)}"
}
