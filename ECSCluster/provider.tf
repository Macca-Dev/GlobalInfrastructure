module "hosting" {
    source = "git::https://github.com/Macca-Dev/Terraform.Modules.git//SiteEcsCluster"
    access = "${var.access-key}"
    app = "${var.app}"
    asg-max = "${var.asg-max}"
    asg-min = "${var.asg-min}"
    env = "${var.env}"    
    instance-profile = "Get from another output"
    keypair-name = "create this"
    secret = "${var.secret-key}"
    user-data = "Will need to create this from a rendered thingy"
}