
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
  default = "/dev/xvdf"
     }

     variable "AppVolumeMountPath" {
  default = "/glide"
     }

     variable "AppVolumeSize" {
  default = "50"
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
  default = "https://bootstrap.pypa.io/get-pip.py"
     }
  
     variable "CloudWatchLogsAgentUrl" {
  default = ""
     }
  
     variable "CloudWatchLogsConfigUrl" {
  default = ""
     }
  
     variable "CloudWatchLogsInstallUrl" {
  default = ""
     }
  
     variable "InstanceRole" {
  default = ""
     }
  
     variable "InstanceType" {
  default = "t2.micro"
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
  
     variable "PuppetInstallScriptUrl" {
  default = ""
     }
  
     variable "PuppetMasterIp" {
  default = ""
     }
  
     variable "PuppetEnvironment" {
  default = "sbx"
     }
  
     variable "PuppetAgentRpm" {
  default = ""
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
  variable "role_arn" {
    default = ""
    }
  variable "role_session_name" {
    default = "terraform"
    }