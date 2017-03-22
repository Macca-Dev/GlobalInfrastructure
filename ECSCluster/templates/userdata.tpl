#!/bin/bash
yum update -y
yum install -y httpd24
echo ECS_CLUSTER=${app} >> /etc/ecs/ecs.config
