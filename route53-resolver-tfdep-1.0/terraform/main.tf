# /*
# terraform {
#   required_version = ">0.15.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 3.44.0"
#     }
#   }

#   backend "s3" {
#     bucket         = "terraform-state-va"
#     region         = "us-east-1"
#     key            = "Route-53-dns-resolver"
#     #dynamodb_table = "tf_state"
#   }

# }
# */
provider "aws" {
  region = var.aws_region
}

# data "aws_ssm_parameter" "transit_gateway_id" {
#   name = "transit_gateway_id"
# }

# if you have a vpc, subnets 

# module "dns_resolver_vpc" {
#   source             = "../../vpc-2.0"
#   name               = var.name
#   aws_region         = var.aws_region
#   cidr_block         = cidrsubnet(var.cidr_block, 1, 1)
#   availability_zones = var.availability_zones
#   subnet_bits        = ceil(length(var.availability_zones) / 2)
#   # transit_gateway_id = data.aws_ssm_parameter.transit_gateway_id.value
#   transit_gateway_id = "1273hf49"

# }

# This was to get the subnet cidr from the vpc module

# data "aws_subnet" "subnet1" {
#   id = module.dns_resolver_vpc.subnets[0]
# }
# data "aws_subnet" "subnet2" {
#   id = module.dns_resolver_vpc.subnets[1]
# }
module "route53-outbound" {
  source            = "../../route53-endpoint-sg-tfmod-1.0"
  name              = var.outbound_endpoint_name
  allowed_resolvers = var.outbound_endpoint_allowed_resolvers
  direction         = "outbound"
  vpc_id            = var.vpc_id
  ip_addresses =  var.subnetsAndIps
  }




module "route53-inbound" {
  source            = "../../route53-endpoint-sg-tfmod-1.0"
  name              = var.inbound_endpoint_name
  allowed_resolvers = var.inbound_endpoint_allowed_resolvers
  direction         = "inbound"
  vpc_id            = var.vpc_id
  ip_addresses = var.subnetsAndIps
}

module "route53-rule" {
  source                  = "../../route53-outbound-rule-tfmod-1.0"
  for_each                = toset(var.forward_domains)
  name                    = replace(each.key, ".", "")
  associated_vpcs         = [var.vpc_id]
  forward_domain          = each.key
  forward_ips             = var.forward_ips
  resolver_endpoint       = module.route53-outbound.endpoint_id
  resource_share_accounts = var.resource_share_accounts
}
