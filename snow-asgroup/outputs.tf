#output "URL" {
#  value = "https://${aws_acm_certificate.cert.domain_name}/guacamole"
#}
output "snowasg_ScaleDownScheduledAction" {
value = "${aws_cloudformation_stack.snowasg.outputs.ScaleDownScheduledAction}"
}
#
#output "rdcb_instanceip" {
# value = "${lookup(data.aws_cloudformation_stack.rdcb.outputs, "RdcbEc2InstanceIp", "")}"
#}
#
#output "rdcb_instanceid" {
# value = "${lookup(data.aws_cloudformation_stack.rdcb.outputs, "RdcbEc2InstanceId", "")}"
#}

# "outputs.ScaleDownScheduledAction": "test-Scale-1B0WTC7DYV301",
# "outputs.ScaleUpScheduledAction": "test-Scale-13TL5ZNYEM1HJ",
# "outputs.ServiceNowAutoscalingGroupId": "test-snow-autoscaling-bfm-ServiceNowAutoscalingGroup-1L578XTSVS3CC",
# "outputs.ServiceNowLaunchConfigId": "test-snow-autoscaling-bfm-ServiceNowLaunchConfig-99HEFULWSU0W",
# "outputs.ServiceNowLaunchConfigLogGroupName": "/aws/ec2/lx/test-snow-autoscaling-bfm",