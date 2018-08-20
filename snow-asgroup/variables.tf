
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
     variable "InstanceRole" {
  default = ""
     }
  
     variable "InstanceType" {
  default = "t2.medium"
     }
  
     variable "KeyPairName" {
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
  
     variable "ServiceNowJarZipUrl" {
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