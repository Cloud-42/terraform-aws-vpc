#--------------------------------------------------------------
# Public subnets 
#--------------------------------------------------------------

resource "aws_subnet" "public_subnets" {
  count                   = length(split(",", var.public_subnets))
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(split(",", var.public_subnets), count.index)
  availability_zone       = element(split(",", var.availability_zones), count.index)
  map_public_ip_on_launch = true

  tags = {
    Name                     = "${var.environment}.sn.public.${element(split(",", var.availability_zones), count.index)}"
    Environment              = var.environment
    Description              = "public.${element(split(",", var.availability_zones), count.index)}"
    Contact                  = var.vpc_contact
    Orchestration            = var.global_orchestration
    Visibility               = "public"
    "kubernetes.io/role/elb" = var.k8s_public_elb_role
  }

  #lifecycle {
  #  ignore_changes = [tags]
  #}
}

#--------------------------------------------------------------
# Private subnets
#--------------------------------------------------------------

resource "aws_subnet" "private_subnets" {
  count                   = length(split(",", var.private_subnets))
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(split(",", var.private_subnets), count.index)
  availability_zone       = element(split(",", var.availability_zones), count.index)
  map_public_ip_on_launch = false

  tags = {
    Name                              = "${var.environment}.sn.private.${element(split(",", var.availability_zones), count.index)}"
    Environment                       = var.environment
    Description                       = "private.${element(split(",", var.availability_zones), count.index)}"
    Contact                           = var.vpc_contact
    Orchestration                     = var.global_orchestration
    Visibility                        = "private"
    "kubernetes.io/role/internal-elb" = var.k8s_private_elb_role
  }

  #lifecycle {
  #  ignore_changes = [tags]
  #}
}
