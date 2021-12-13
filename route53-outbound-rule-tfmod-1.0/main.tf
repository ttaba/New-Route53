resource "aws_route53_resolver_rule" "fwd" {
  name                 = var.name
  domain_name          = var.forward_domain
  resolver_endpoint_id = var.resolver_endpoint
  rule_type            = "FORWARD"
  tags                 = var.tags

  dynamic "target_ip" {
    for_each = var.forward_ips

    content {
      ip   = target_ip.value
      port = var.dns_port
    }
  }
}

resource "aws_route53_resolver_rule_association" "fwdrule" {
  count            = length(var.associated_vpcs)
  resolver_rule_id = aws_route53_resolver_rule.fwd.id
  vpc_id           = var.associated_vpcs[count.index]
}

resource "aws_ram_resource_share" "endpoint_share" {
  count                     = length(var.resource_share_accounts) > 0 ? 1 : 0
  name                      = "route53-${var.forward_domain}-share"
  allow_external_principals = false
}

resource "aws_ram_principal_association" "endpoint_ram_principal" {
  count              = length(var.resource_share_accounts)
  principal          = var.resource_share_accounts[count.index]
  resource_share_arn = aws_ram_resource_share.endpoint_share[0].arn
}

resource "aws_ram_resource_association" "endpoint_ram_resource" {
  count              = length(var.resource_share_accounts) > 0 ? 1 : 0
  resource_arn       = aws_route53_resolver_rule.fwd.arn
  resource_share_arn = aws_ram_resource_share.endpoint_share[0].arn
}
