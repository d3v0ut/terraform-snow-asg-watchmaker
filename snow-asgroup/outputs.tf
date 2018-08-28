output "snowasg_ScaleDownScheduledAction" {
value = "${aws_cloudformation_stack.snowasg.outputs["ScaleDownScheduledAction"]}"
}
output "snowasg_ScaleUpScheduledAction" {
value = "${aws_cloudformation_stack.snowasg.outputs["ScaleUpScheduledAction"]}"
}
output "snowasg_ServiceNowAutoscalingGroupId" {
value = "${aws_cloudformation_stack.snowasg.outputs["ServiceNowAutoscalingGroupId"]}"
}
output "snowasg_ServiceNowLaunchConfigId" {
value = "${aws_cloudformation_stack.snowasg.outputs["ServiceNowLaunchConfigId"]}"
}
output "snowasg_ServiceNowLaunchConfigLogGroupName" {
value = "${aws_cloudformation_stack.snowasg.outputs["ServiceNowLaunchConfigLogGroupName"]}"
}