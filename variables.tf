variable "all_cidr_blocks" {
  default = "0.0.0.0/0"
}

variable "core_ssh_cidr_blocks" {
  description = "SSH CIDR. Used by SSH Secuirty Group to grant access"
}

variable "vpc_subnet" {
  description = "CIDR range for VPC"
}

variable "dns_domain" {
  description = "Public Route 53 Zone name. Optional - If no value is set zone will not be created"
  default     = 0
}

variable "availability_zones" {
  description = "Availability zones"
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
}

variable "environment" {
  description = "Environment"
}

variable "vpc_contact" {
  description = "Contact tag"
}

variable "global_orchestration" {
  description = "Orchestration tag"
}

variable "domain_name_servers" {
  description = "Comma separated list of domain name servers to use in DHCP options"
  default     = "AmazonProvidedDNS"
}

variable "vpc_propagating_vgws" {
  description = "Comma separated list of Virtual Gateways that propagate routes to the private routing tables in addition to the one created."
  default     = ""
}

variable "vpc_enable_flow_logs" {
  description = "Set to 1 to enable flow logs for the VPC"
  default     = "1"
}

variable "vpcflowlogs_traffic_type" {
  description = "VPC flow logs traffic type. One of ACCEPT,REJECT, ALL"
  default     = "ALL"
}

variable "vpc_flow_logs_s3_name" {
  description = "Name for the s3 bucket that holds the VPC flow logs"
}

variable "k8s_public_elb_role" {
  description = "Provides the ability to tag subnets for EKS ALB Public use"
  default     = "1"
}

variable "k8s_private_elb_role" {
  description = "Provides the ability to tag subnets for EKS ALB Private use"
  default     = "1"
}

