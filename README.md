# terraform-snow-asg-watchmaker

Place the CFn template "make_servicenow_autoscaling.template" in the "cfn" folder

Fill out the terraform.tfvar.template file in each folder with your variables.  Remove the .template extension.

If upgrading a ServiceNow version, after deploying the nodes, update the system_properties table records "glide.war" and "glide.war.properties" to the patch version.  ex: glide-jakarta-05-03-2017__patch9-05-02-2018_05-10-2018_1459.zip

Run Terraform Apply