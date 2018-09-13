provider "aws" {
  #  use aws profile for iam access keys
  region = "${var.region}"
  profile = "${var.terra-profile}"
  version = "~> 1.32.0"
assume_role {
    role_arn = "${var.role_arn}"
    session_name = "${var.role_session_name}"
  }
}
module "snow-asgroup" {
  source = "./snow-asgroup"
  "AmiId" = "${var.AmiId}"
  "AmiDistro" = "${var.AmiDistro}"
  "AppScriptParams" = "${var.AppScriptParams}"
  "AppScriptShell" = "${var.AppScriptShell}"
  "AppScriptUrl" = "${var.AppScriptUrl}"
  "AppVolumeDevice" = "${var.AppVolumeDevice}"
  "AppVolumeMountPath" = "${var.AppVolumeMountPath}"
  "AppVolumeSize" = "${var.AppVolumeSize}"
  "AppVolumeType" = "${var.AppVolumeType}"
  "CfnBootstrapUtilsUrl" = "${var.CfnBootstrapUtilsUrl}"
  "CfnEndpointUrl" = "${var.CfnEndpointUrl}"
  "CfnGetPipUrl" = "${var.CfnGetPipUrl}"
  "CloudWatchAgentUrl" = "${var.CloudWatchAgentUrl}"
  "CloudWatchLogsAgentUrl" = "${var.CloudWatchLogsAgentUrl}"
  "CloudWatchLogsConfigUri" = "${var.CloudWatchLogsConfigUri}"
  "CloudWatchLogsInstallUri" = "${var.CloudWatchLogsInstallUri}"
  "DesiredCapacity" = "${var.DesiredCapacity}"
  "InstanceRole" = "${var.InstanceRole}"
  "InstanceType" = "${var.InstanceType}"
  "KeyPairName" = "${var.KeyPairName}"
  "LogGroupName" = "${var.LogGroupName}"
  "MaxCapacity" = "${var.MaxCapacity}"
  "MinCapacity" = "${var.MinCapacity}"
  "NoPublicIp" = "${var.NoPublicIp}"
  "NoReboot" = "${var.NoReboot}"
  "NoUpdates" = "${var.NoUpdates}"
  "PypiIndexUrl" = "${var.PypiIndexUrl}"
  "RdsEndpointAddress" = "${var.RdsEndpointAddress}"
  "RdsDbUsername" = "${var.RdsDbUsername}"
  "RdsDbPassword" = "${var.RdsDbPassword}"
  "ScaleDownSchedule" = "${var.ScaleDownSchedule}"
  "ScaleUpSchedule" = "${var.ScaleUpSchedule}"
  "SecurityGroupIds" = "${var.SecurityGroupIds}"
  "ServiceNowInstallScript" = "${var.ServiceNowInstallScript}"
  "ServiceNowInstallTimeout" = "${var.ServiceNowInstallTimeout}"
  "ServiceNowJarZipUri" = "${var.ServiceNowJarZipUri}"
  "SubnetIds" = "${var.SubnetIds}"
  "ToggleCfnInitUpdate" = "${var.ToggleCfnInitUpdate}"
  "ToggleNewInstances" = "${var.ToggleNewInstances}"
  "WatchmakerAdminGroups" = "${var.WatchmakerAdminGroups}"
  "WatchmakerAdminUsers" = "${var.WatchmakerAdminUsers}"
  "WatchmakerConfig" = "${var.WatchmakerConfig}"
  "WatchmakerEnvironment" = "${var.WatchmakerEnvironment}"
  "WatchmakerOuPath" = "${var.WatchmakerOuPath}"
  "stackname" = "${var.stackname}"
  "s3bucket" = "${var.s3bucket}"
  "lb-tg-sg1" = "${aws_security_group.tg-sg1.id}"
  "local-exec-profile" = "${var.local-exec-profile}" 
  
  }
resource "aws_route53_record" "lb_pub_dns" {
  count = "${var.create_certificate == true ? 1 : 0}"
  zone_id = "${var.public_dnszone_id}"
  name    = "${var.dns_name}"
  type    = "A"
  alias {
    name                   = "${aws_lb.alb.dns_name}"
    zone_id                = "${aws_lb.alb.zone_id}"
    evaluate_target_health = true
  }
}
resource "aws_acm_certificate" "cert" {
  count = "${var.create_certificate == true ? 1 : 0}"
  domain_name       = "${aws_route53_record.lb_pub_dns.fqdn}"
  validation_method = "DNS"
  tags {
    Name      = "${var.stackname}"
    Terraform = "True"
  }
}
resource "aws_route53_record" "cert_validation" {
  count = "${var.create_certificate == true ? 1 : 0}"
  name    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
  zone_id = "${var.public_dnszone_id}"
  records = ["${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}
resource "aws_acm_certificate_validation" "cert" {
  count = "${var.create_certificate == true ? 1 : 0}"
  certificate_arn         = "${aws_acm_certificate.cert.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}
resource "aws_lb" "alb" {
  name               = "${var.stackname}-alb"
  internal           = "${var.lb_internal}"
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.lb-sg1.id}"]
  subnets            = ["${var.lb_subnets}"]
  tags {
    Name      = "${var.stackname}"
    Terraform = "True"
  }
}
resource "aws_lb_target_group" "alb_tg" {
  name     = "${var.stackname}-alb-tg"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = "${var.VpcId}"
  deregistration_delay = "${var.deregistration_delay}"
  stickiness {
    type = "lb_cookie"
    cookie_duration = "${var.cookie_duration}"
    enabled = "${var.stickiness}"
  }
  health_check {
    path = "/"
    matcher = "200"
    protocol = "HTTPS"
    interval = "${var.interval}"
    timeout = "${var.timeout}"
    healthy_threshold = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
  }
}
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  certificate_arn   = "${var.create_certificate == true ? join("", aws_acm_certificate.cert.*.arn) : var.optional_existing_cert_arn}"
  default_action {
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
    type             = "forward"
  }
}
resource "aws_security_group" "lb-sg1" {
  name_prefix        = "${var.stackname}-lb-sg1"
  description = "Security group for accessing SNow via the Internet"
  vpc_id = "${var.VpcId}"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name      = "${var.stackname}-lb-sg1"
    Terraform = "True"
  }
}
resource "aws_security_group" "tg-sg1" {
  name_prefix        = "${var.stackname}-tg-sg1"
  description = "Security group for accessing SNow via the Load Balancer"
  vpc_id = "${var.VpcId}"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = ["${aws_security_group.lb-sg1.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name      = "${var.stackname}-tg-sg1"
    Terraform = "True"
  }
}
resource "aws_autoscaling_attachment" "snowasg_attachment" {
  autoscaling_group_name = "${module.snow-asgroup.snowasg_ServiceNowAutoscalingGroupId}"
  alb_target_group_arn   = "${aws_lb_target_group.alb_tg.arn}"
}
provider "dns" {
  version = "~> 2.0.0"
  update {
  server = "${var.DnsServer}"
  }
}
resource "dns_cname_record" "snow-pilot-record" {
count = "${var.create_certificate == false ? 1 : 0}"
zone = "${var.DnsZone}"
name = "${var.DnsRecordName}"
cname = "${aws_lb.alb.dns_name}."
ttl = "${var.Ttl}"
}