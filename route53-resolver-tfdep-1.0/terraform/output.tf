output "endpoint_id" {
  value = module.route53-inbound.endpoint_id
}

output "security_group_id" {
  value = module.route53-inbound.security_group_id
}

output "ip_addresses" {
  value = module.route53-inbound.ip_addresses
}
