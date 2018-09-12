variable "region" {
  default = "us-east-1"
}

## rdcb module variables
variable "AmiId" {
  default = "ami-0748b8574d41a3ebb"
     }
variable "AmiDistro" {
  default = "CentOS"
}
variable "AppScriptParams" {
  default = ""
}
variable "AppScriptShell" {
  default = "bash"
}
variable "AppScriptUrl" {
  default = ""
}
variable "AppVolumeDevice" {
  default = "true"
}
variable "AppVolumeMountPath" {
  default = "/glide"
}
variable "AppVolumeSize" {
  default = "100"
}
variable "AppVolumeType" {
  default = "gp2"
}
variable "CfnBootstrapUtilsUrl" {
  default = "https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz"
}
variable "CfnEndpointUrl" {
  default = "https://cloudformation.us-east-1.amazonaws.com"
}
variable "CfnGetPipUrl" {
  default = "https://bootstrap.pypa.io/2.6/get-pip.py"
}
variable "CloudWatchAgentUrl" {
  type        = "string"
  description = "(Optional) S3 URL to CloudWatch Agent installer. Example: s3://amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip"
  default     = ""
}
variable "CloudWatchLogsAgentUrl" {
  type      = "string"
  default   = ""
}
variable "CloudWatchLogsConfigUri" {
  type      = "string"
  default   = ""
}
variable "CloudWatchLogsInstallUri" {
  type      = "string"
  default   = ""
}
variable "InstanceRole" {
  default = ""
}
variable "InstanceType" {
  default = "t2.medium"
}
variable "KeyPairName" {
  default = ""
}
variable "LogGroupName" {
       default = ""
}
variable "NoPublicIp" {
  default = "true"
}
variable "NoReboot" {
  default = "false"
}
variable "NoUpdates" {
  default = "false"
}
variable "SecurityGroupIds" {
  default = ""
}
variable "ServiceNowInstallScript" {
  default = ""
}
variable "ServiceNowInstallTimeout" {
  default = "8"
}
variable "ServiceNowJarZipUri" {
  default = ""
}
variable "SubnetIds" {
  default = ""
}
variable "RdsEndpointAddress" {
  default = ""
}
variable "RdsDbUsername" {
  default = "rdsdbadmin"
}
variable "RdsDbPassword" {
  default = ""
}
variable "stackname" {
  default = ""
}
variable "s3bucket" {
  default = ""
}
variable "local-exec-profile" {
  default = "default"
}
variable "terra-profile" {
  default = "default"
}
variable "role_arn" {
  default = ""
}
variable "role_session_name" {
  default = "terraform"
}
variable "DesiredCapacity" {
  default = ""
}
variable "MaxCapacity" {
  default = ""
}
variable "MinCapacity" {
  default = ""
}
variable "PypiIndexUrl" {
  default = ""
}
variable "ScaleDownSchedule" {
  default = ""
}
variable "ScaleUpSchedule" {
  default = ""
}
variable "ToggleCfnInitUpdate" {
  default = ""
}
variable "ToggleNewInstances" {
  default = ""
}
variable "WatchmakerAdminGroups" {
  default = ""
}
variable "WatchmakerAdminUsers" {
  default = ""
}
variable "WatchmakerConfig" {
  default = ""
}
variable "WatchmakerEnvironment" {
  default = ""
}
variable "WatchmakerOuPath" {
  default = ""
}
## Load Balancer Vars
variable "VpcId" {
  default = ""
}
variable "dns_name" {
  default = ""
}
variable "public_subnets" {
  default = ["subnet-public1", "subnet-public2"]
}
variable "public_dnszone_id" {
  default = ""
}
variable "deregistration_delay" {
  default = "300"
}
variable "stickiness" {
  default = "true"
}
variable "cookie_duration" {
  default = "86400"
}
variable "interval" {
  default = "30"
}
variable "timeout" {
  default = "5"
}
variable "healthy_threshold" {
  default = "5"
}
variable "unhealthy_threshold" {
  default = "2"
}
## certificate toggle
## setting create_certificate to false will trigger use of an existing certificate and on-premise dns
## setting create_certificate to true will request a new certificate and handle r53
variable "create_certificate" {
  default = "true"
}
variable "optional_existing_cert_arn" {
  default = ""
}
## on premise dns
variable "DnsServer" {
  default = "1.2.3.4"
  }
variable "DnsZone" {
  default = "myzone.com."
  }
variable "DnsRecordName" {
  default = "myname"
  }
variable "Ttl" {
  default = "300"
  }