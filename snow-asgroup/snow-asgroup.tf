data "aws_cloudformation_stack" "snow-asgroup" {
  name = "${var.stackname}"
  depends_on = ["null_resource.push-changeset"]
}

resource "null_resource" "push-changeset" {
  provisioner "local-exec" {
    command     = "${join(" ", local.create_changeset_command)}"
    #working_dir = ".."
  }

  provisioner "local-exec" {
    command = "${join(" ", local.destroy_changeset_command)}"
    when    = "destroy"
  }
}

resource "null_resource" "check-changeset" {
  provisioner "local-exec" {
    command = "${join(" ", local.check_stack_progress)}"
  }

  triggers = {
    instance_ids = "${join(",", null_resource.push-changeset.*.id)}"
  }
}

locals {
  create_changeset_command = [
    "aws cloudformation deploy --template",
    "cfn/make_servicenow_autoscaling.template.json",
    " --stack-name ${var.stackname}",
    " --parameter-overrides AmiId=${var.AmiId}",
     "\"AmiDistro=${var.AmiDistro}\"",
     "\"AppScriptParams=${var.AppScriptParams}\"", 
     "\"AppScriptShell=${var.AppScriptShell}\"", 
     "\"AppScriptUrl=${var.AppScriptUrl}\"",
     "\"AppVolumeDevice=${var.AppVolumeDevice}\"",
     "\"AppVolumeMountPath=${var.AppVolumeMountPath}\"",
     "\"AppVolumeSize=${var.AppVolumeSize}\"",
     "\"AppVolumeType=${var.AppVolumeType}\"",  
     "\"CfnBootstrapUtilsUrl=${var.CfnBootstrapUtilsUrl}\"",  
     "\"CfnEndpointUrl=${var.CfnEndpointUrl}\"",  
     "\"CfnGetPipUrl=${var.CfnGetPipUrl}\"",  
     "\"CloudWatchLogsAgentUrl=${var.CloudWatchLogsAgentUrl}\"",  
     "\"CloudWatchLogsConfigUrl=${var.CloudWatchLogsConfigUrl}\"",  
     "\"CloudWatchLogsInstallUrl=${var.CloudWatchLogsInstallUrl}\"",  
     "\"InstanceRole=${var.InstanceRole}\"",  
     "\"InstanceType=${var.InstanceType}\"",  
     "\"KeyPairName=${var.KeyPairName}\"",  
     "\"NoPublicIp=${var.NoPublicIp}\"",  
     "\"NoReboot=${var.NoReboot}\"",  
     "\"NoUpdates=${var.NoUpdates}\"",  
     "\"PuppetInstallScriptUrl=${var.PuppetInstallScriptUrl}\"",  
     "\"PuppetMasterIp=${var.PuppetMasterIp}\"",  
     "\"PuppetEnvironment=${var.PuppetEnvironment}\"",  
     "\"PuppetAgentRpm=${var.PuppetAgentRpm}\"",  
     "\"SecurityGroupIds=${var.SecurityGroupIds}\"",  
     "\"ServiceNowInstallScript=${var.ServiceNowInstallScript}\"",  
     "\"ServiceNowInstallTimeout=${var.ServiceNowInstallTimeout}\"",  
     "\"ServiceNowJarZipUrl=${var.ServiceNowJarZipUrl}\"",  
     "\"SubnetIds=${var.SubnetIds}\"",  
     "\"RdsEndpointAddress=${var.RdsEndpointAddress}\"",  
     "\"RdsDbUsername=${var.RdsDbUsername}\"",  
     "\"RdsDbPassword=${var.RdsDbPassword}\"",
    "--capabilities CAPABILITY_IAM",
    "--profile ${var.local-exec-profile}",
  ]

  check_stack_progress = [
    "aws cloudformation wait stack-create-complete --stack-name ${var.stackname}",
  ]

  destroy_changeset_command = [
    "aws cloudformation delete-stack --stack-name ${var.stackname}",
  ]
}