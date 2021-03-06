output "nat_eips" {
  value = join(",", aws_eip.nat.*.public_ip)
}

output "dns_zone_id" {
  depends_on = [
    aws_route53_zone.vpc_public_zone
  ]
  value = var.dns_domain != 0 ? join(",", aws_route53_zone.vpc_public_zone.*.zone_id) : 0
}

output "private_route_table" {
  value = join(",", aws_route_table.private_route_table.*.id)
}

output "public_route_table" {
  value = join(",", aws_route_table.public_route_table.*.id)
}

output "subnets_public" {
  value = join(",", aws_subnet.public_subnets.*.id)
}

output "subnets_private" {
  value = join(",", aws_subnet.private_subnets.*.id)
}

output "vgw_id" {
  value = aws_vpn_gateway.main_vgw.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "zone_id" {
  depends_on = [
    aws_route53_zone.vpc_public_zone
  ]
  value = var.dns_domain != 0 ? join(",", aws_route53_zone.vpc_public_zone.*.zone_id) : 0
}

#
# TF v12 test
# https://www.hashicorp.com/blog/terraform-0-12-rich-value-types/
# Entire objects can now be exported as outputs
#

output "vpc" {
  value = aws_vpc.main
}
