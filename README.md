<p align="center">
  <a href="https://www.cloud42.io/" target="_blank" rel="Homepage">
  <img width="200" height="200" src="https://www.cloud42.io/wp-content/uploads/2020/01/transparent_small.png">
  </a>
</p>

---
<p align="center">Need help with your Cloud builds <a href="https://www.cloud42.io/contact/" target="_blank" rel="ContactUS"> GET IN TOUCH</a>.</p>

---
## Standard VPC build.

Upon launching the stack the following resources will be created:

 * VPC infrastructure
 * Public, private & data subnets as defined in input variables.
 * Route tables for subnets
 * Generic security groups
 * Route53 Hosted Zone
 * Elastic IPs and Managed NAT gateway devices for each Availability Zone
 * A virtual private gateway for use with Direct Connect and/or IPsec VPNs

## Dependencies and Prerequisites
 * Terraform v0.12. or higher
 * AWS account

## Variables
| Variable | Meaning |
| :------- | :----- |
| `all_cidr_blocks`| Default: 0.0.0.0/0 |
| `domain_name_servers` | Comma separated list of domain name servers to use in DHCP options|
| `dns_domain` | DNS domain name. Optional - if set Route 53 zone will be created and domain added to DHCP option set |
| `key_name` | ssh key name to use |
| `vpc_subnet` | VPC CIDR block to use for the VPC |
| `vpc_name` | Name of the VPC |
| `availability_zones` | Availability Zones to use |
| `public_subnets` | CIDR blocks for the public subnets |
| `private_subnets` | CIDR blocks for the private subnets |
| `environment` |Environment to deploy for|
| `vpc_propagating_vgws` |Comma separated list of Virtual Gateways that propagate routes to the private routing tables in addition to the one created. Optional. |
| `vpc_enable_flow_logs` |Set to "1" to enable flow logs for the VPC, logging to s3. Defaults to "1"|
| `k8s_public_elb_role` |EKS looks for subnet tags in order to decide where to place ALBs. Allows for public subnet tag to be set.|
| `k8s_private_elb_role` |EKS looks for subnet tags in order to decide where to place ALBs. Allows for private subnet tag to be set.|

## Outputs
 * core\_ssh\_cidr\_blocks
 * nat\_eips
 * dns\_zone\_id
 * public\_subnets
 * private\_subnets
 * vgw\_id
 * vpc\_id
 * zone\_id
 * private\_route\_table
 * public\_route\_table

## Usage

To import the module add the following to the environment TF file:
```
module "vpc" {
  source  = "Cloud-42/vpc/aws"
  version = "3.0.0"

  
  availability_zones        = var.availability_zones
  environment               = var.environment
  dns_domain                = var.dns_domain
  private_subnets           = var.private_subnets
  public_subnets            = var.public_subnets
  vpc_subnet                = var.vpc_subnet_cidr
  vpc_contact               = var.contact
  core_ssh_cidr_blocks      = var.core_ssh_cidr_blocks
  global_orchestration      = var.orchestration
  flow_logs_s3_name         = var.vpc_flow_logs_s3_name
}
```
* To initialise the module run: terraform init
* To update the module run    : terraform get --update
* To see a plan of changes    : terraform plan
* To apply                    : terraform apply 

