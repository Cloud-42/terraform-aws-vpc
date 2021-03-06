resource "aws_route53_zone" "vpc_public_zone" {
  count = var.dns_domain != 0 ? 1 : 0
  name  = var.dns_domain

  tags = {
    Name          = "${var.environment}.PublicZone"
    Environment   = var.environment
    Description   = "PublicZone"
    Contact       = var.vpc_contact
    Orchestration = var.global_orchestration
  }
}

resource "aws_vpc_dhcp_options" "options" {
  domain_name         = var.dns_domain != 0 ? var.dns_domain : null
  domain_name_servers = split(",", var.domain_name_servers)

  tags = {
    Name          = "${var.environment}.dhcp_options"
    Environment   = var.environment
    Description   = "dhcp_options"
    Contact       = var.vpc_contact
    Orchestration = var.global_orchestration
  }
}

resource "aws_vpc_dhcp_options_association" "local_resolver" {
  vpc_id          = aws_vpc.main.id
  dhcp_options_id = aws_vpc_dhcp_options.options.id
}

