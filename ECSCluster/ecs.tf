module "hosting" {
    source = "git::https://github.com/Macca-Dev/Terraform.Modules.git//SiteEcsCluster"
    access = "${var.access}"
    app = "${var.app}"
    asg-desired = "${var.asg-desired}"
    asg-max = "${var.asg-max}"
    asg-min = "${var.asg-min}"
    env = "${var.env}"    
    instance-profile = "${aws_iam_instance_profile.ecs_instance.name}"
    keypair-name = "${var.keypair}"
    secret = "${var.secret}"
    user-data = "${data.template_file.userdata.rendered}"
}

data "template_file" "userdata" {
    template = "${file("${path.module}/templates/userdata.tpl")}"
    vars {
        app = "${var.app}"
    }
}
