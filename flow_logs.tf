# -------------------------------
# VPC Flow logs
# -------------------------------
resource "aws_flow_log" "vpc" {
  count                = var.vpc_enable_flow_logs
  log_destination      = aws_s3_bucket.flow_logs[0].arn
  log_destination_type = "s3"
  traffic_type         = var.vpcflowlogs_traffic_type
  vpc_id               = aws_vpc.main.id
}

resource "aws_s3_bucket" "flow_logs" {
  count  = var.vpc_enable_flow_logs
  bucket = var.environment-var.vpc_flow_logs_s3_name
}
